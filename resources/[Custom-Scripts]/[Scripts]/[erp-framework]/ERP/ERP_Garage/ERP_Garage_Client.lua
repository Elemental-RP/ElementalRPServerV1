local ERPG = ERP.Garage
-------------------------------------------
--#######################################--
--##                                   ##--
--##      Blip and Marker Updates      ##--
--##                                   ##--
--#######################################--
-------------------------------------------

function ERPG:UpdateMarkers()
    if not self or not self.Config or not self.Config.Markers then return; end

    for key,val in pairs(self.Config.Markers) do
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), val.Pos.x, val.Pos.y, val.Pos.z) < self.Config.MarkerDrawDistance then
            DrawMarker(val.Type, val.Pos.x, val.Pos.y, val.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, val.Scale.x, val.Scale.y, val.Scale.z, val.Color.r, val.Color.g, val.Color.b, 100, false, true, 2, false, false, false, false)
        end
    end
end

function ERPG:SetBlips()
    if not self or not self.Config or not self.Config.Blips then return; end

    for key,val in pairs(self.Config.Blips) do
        local blip = AddBlipForCoord(val.Pos.x, val.Pos.y, val.Pos.z)
        SetBlipSprite               (blip, val.Sprite)
        SetBlipDisplay              (blip, val.Display)
        SetBlipScale                (blip, val.Scale)
        SetBlipColour               (blip, val.Color)
        SetBlipAsShortRange         (blip, true)
        SetBlipHighDetail           (blip, true)
        BeginTextCommandSetBlipName ("STRING")
        AddTextComponentString      (val.Zone)
        EndTextCommandSetBlipName   (blip)
    end
end

-------------------------------------------
--#######################################--
--##                                   ##--
--##       Check player position       ##--
--##        relevant to markers        ##--
--##                                   ##--
--#######################################--
-------------------------------------------

function ERPG:CheckPosition()
    if not self or not self.Config or not self.Config.Markers then return; end

    self.StandingInMarker = self.StandingInMarker or false
    self.CurrentGarage = self.CurrentGarage or {}

    local standingInMarker = false

    for key,val in pairs(self.Config.Markers) do
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), val.Pos.x, val.Pos.y, val.Pos.z) < val.Scale.x then
            self.CurrentGarage = val
            standingInMarker = true
        end
    end

    if standingInMarker and not self.StandingInMarker then
        self.StandingInMarker = true
        self.ActionData = ActionData or {};
        self.ActionData.Action = self.CurrentGarage.Zone            
        self.ActionData.Message = 'Pressiona ~INPUT_PICKUP~ para abrir a/os ~b~' .. (self.CurrentGarage.Zone:sub(1,1):lower()..self.CurrentGarage.Zone:sub(2)) .. '~s~.'
    end

    if not standingInMarker and self.StandingInMarker then
        self.StandingInMarker = false
        self.ActionData.Action = false
        self.ESX.UI.Menu.CloseAll()
    end
end

-------------------------------------------
--#######################################--
--##                                   ##--
--##        Check for input if         ##--
--##           inside marker           ##--
--##                                   ##--
--#######################################--
-------------------------------------------

function ERPG:CheckInput()
    if not self or not self.ActionData then return; end

    self.Timer = self.Timer or 0

    if self.ActionData.Action ~= false then
        SetTextComponentFormat('STRING')
        AddTextComponentString(self.ActionData.Message)
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)

        if IsControlPressed(0, ERPUtils.Keys['E']) and (GetGameTimer() - self.Timer) > 150 then
            self:OpenGarageMenu(self.ActionData.Action)
            self.ActionData.Action = false
            self.Timer = GetGameTimer()
        end
    end
end

-------------------------------------------
--#######################################--
--##                                   ##--
--##            Garage Menu            ##--
--##                                   ##--
--#######################################--
-------------------------------------------

function ERPG:OpenGarageMenu(zone)
    if not self or not self.ESX or not self.Config then return; end

    self.ESX.UI.Menu.CloseAll()

    local elements = {}
    local price = 0

    if zone == 'Apreendidos' and self.Config.ImpoundCost > 0 then str = zone .. ' - €' .. self.Config.ImpoundCost
    else
        if self.Config.RepairCost > 0 then
            local playerPed = GetPlayerPed(PlayerId())
            
            local vehicle = GetLastDrivenVehicle(playerPed)   
            if vehicle then
                local vehHealth = (GetVehicleBodyHealth(vehicle) / 10)           -- 0 - 100
                local dmg = 0

                while dmg + vehHealth < 100 do
                    dmg = dmg + 1
                    Citizen.Wait(0)
                end

                if dmg > 0 then
                    price = math.floor((self.Config.RepairCost / 100) * dmg)   -- percententage based on vehHealth
                    str = zone .. ' - €' .. price
                else str = zone; end
            else str = zone; end
        else str = zone; end
    end

    if price and price > 0 then labelStr = "Guardar Veículo : €" .. price
    else labelStr = "Guardar Veículo"; end

    table.insert(elements,{label = "Os teus Veículos", value = zone .. "_List"})
    table.insert(elements,{label = labelStr, value = zone .. "_Vehicle"})

    self.ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), zone .. '_Menu',
        {
            title = str,
            align = 'left',
            elements = elements,
        },

        function(data, menu)
            menu.close()
            if string.find(data.current.value, "_List") then
                self:OpenVehicleList(zone)
            end

            if string.find(data.current.value, "_Vehicle") then
                self:StoreVehicle(zone, price)
            end
        end,
        function(data, menu)
            menu.close()
            self.ActionData.Action = self.CurrentGarage.Zone  
        end
    )
end

-------------------------------------------
--#######################################--
--##                                   ##--
--##         Vehicle List Menu         ##--
--##                                   ##--
--#######################################--
-------------------------------------------

function ERPG:OpenVehicleList(zone)
    if not self or not self.ESX or not ESX then return; end

    self.ESX.UI.Menu.CloseAll()
    local elements = {}
    ESX.TriggerServerCallback('ERPG:GetVehicles', function(vehicles)
        for key,val in pairs(vehicles) do
            local hashVehicle = val.vehicle.model
            local vehiclePlate = val.plate
            local vehicleName = GetDisplayNameFromVehicleModel(hashVehicle)
            local labelvehicle

            if val.stored == 1 then
                labelvehicle = '<span style="font-weight:bold;">' .. vehicleName .. ' </span>: ' .. vehiclePlate .. ' : <span style="font-weight:bold;color:green;">Na Garagem</span>'            
            elseif val.stored == 2 then
                labelvehicle = '<span style="font-weight:bold;">' .. vehicleName .. ' </span>: ' .. vehiclePlate .. ' : <span style="font-weight:bold;color:orange;">Apreendidos</span>'      
            else                
                labelvehicle = '<span style="font-weight:bold;">' .. vehicleName .. ' </span>: ' .. vehiclePlate .. ' : <span style="font-weight:bold;color:red;">Desconhecido</span>'      
            end 

            table.insert(elements, {label =labelvehicle , value = val})                      
        end
        self:LoadVehicles(vehicles)
        self.ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'Spawn_Vehicle',
        {
            title    = zone,
            align    = 'left',
            elements = elements,
        },

        function(data, menu)
            if zone == 'Garagem' then
                if data.current.value.stored == 1 then
                    menu.close()
                    ERPG:SpawnVehicle(data.current.value.vehicle, zone)
                else
					exports['mythic_notify']:SendAlert('inform', 'O teu veículo não está na garagem')
                end
            end

            if zone == 'Apreendidos' then
                if data.current.value.stored == 2 then
                    local playerData = ESX.GetPlayerData()
                    if playerData.money >= self.Config.ImpoundCost then
                        ERPG:SpawnVehicle(data.current.value.vehicle, zone)
                    else
						exports['mythic_notify']:SendAlert('inform', 'Não tens dinheiro suficiente')
                    end
                    menu.close()
                else
					exports['mythic_notify']:SendAlert('inform', 'O teu veículo não está apreendido')
                end
            end            
            self:UnloadVehicles(vehicles)
        end,

        function(data, menu)
            menu.close()
            self:UnloadVehicles(vehicles)
            self:OpenGarageMenu(zone)
        end
    )   
    end)
end

function ERPG:LoadVehicles(vehicles)
    for k,v in pairs(vehicles) do
        while not HasModelLoaded(v.vehicle.model) do
            RequestModel(v.vehicle.model)
            Citizen.Wait(0)
        end
    end
end

function ERPG:UnloadVehicles(vehicles)
    for k,v in pairs(vehicles) do
        if HasModelLoaded(v.vehicle.model) then
            SetModelAsNoLongerNeeded(v.vehicle.model)
        end
    end
end
-------------------------------------------
--#######################################--
--##                                   ##--
--##      Spawn vehicle function       ##--
--##                                   ##--
--#######################################--
-------------------------------------------
function ERPG:SpawnVehicle(vehicle, zone)
    if not self or not self.ESX or not ESX then return; end
    self.DrivenVehicles = self.DrivenVehicles or {}

    ESX.Game.SpawnVehicle(vehicle.model,{
        x=self.CurrentGarage.Pos.x,
        y=self.CurrentGarage.Pos.y,
        z=self.CurrentGarage.Pos.z + 1,                                         
        },self.CurrentGarage.Heading, function(callback_vehicle)
        self.ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
        SetVehRadioStation(callback_vehicle, "OFF")

        TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
        table.insert(self.DrivenVehicles, {vehicle = callback_vehicle})

        local vehicleId GetVehiclePedIsUsing(GetPlayerPed(-1))
        SetEntityAsMissionEntity(GetVehicleAttachedToEntity(vehicleId), true, true)

        local vehicleProps = self.ESX.Game.GetVehicleProperties(callback_vehicle)
        TriggerServerEvent('ERPG:ChangeState', vehicleProps.plate, 0)
        if zone == 'Apreendidos' then TriggerServerEvent('ERPG:FinePlayer', self.Config.ImpoundCost); end
        self.ActionData.Action = self.CurrentGarage.Zone  
    end) 
end

-------------------------------------------
--#######################################--
--##                                   ##--
--##      Store vehicle function       ##--
--##                                   ##--
--#######################################--
-------------------------------------------

function ERPG:StoreVehicle(zone, price)
    if not self or not self.CurrentGarage or not ESX or not self.ESX then return; end

    local playerPed = GetPlayerPed(PlayerId())
    local vehicle = GetLastDrivenVehicle(playerPed)   

    if not vehicle then return; end

    if price and price > 0 then
        local playerData = ESX.GetPlayerData()
        if playerData.money and playerData.money > price then
            TriggerServerEvent('ERPG:FinePlayer', price)
        else return; end
    end

    local vehicleProps = self.ESX.Game.GetVehicleProperties(vehicle)
    local maxPassengers = GetVehicleMaxNumberOfPassengers(vehicle)

    for seat = -1,maxPassengers-1,1 do
        local ped = GetPedInVehicleSeat(vehicle,seat)
        if ped and ped ~= 0 then TaskLeaveVehicle(ped,vehicle,16); end
    end

    while true do
        if not IsPedInVehicle(GetPlayerPed(PlayerId()), vehicle, false) then
            ESX.TriggerServerCallback('ERPG:StoreVehicle', function(valid)
                if(valid) then
                    DeleteVehicle(vehicle)
                    if zone == 'Apreendidos' then 
                        storage = 2
                    else 
                        storage = 1 
                    end

                    TriggerServerEvent('ERPG:ChangeState', vehicleProps.plate, storage);
					exports['mythic_notify']:SendAlert('inform', 'O teu veículo foi guardado')
                else
					exports['mythic_notify']:SendAlert('inform', 'Este veículo não te pertence')
                end
            end, vehicleProps)

            self.ActionData.Action = self.CurrentGarage.Zone  
            break
        end

        Citizen.Wait(0)      
    end
end

-------------------------------------------
--#######################################--
--##                                   ##--
--##      Vehicle Check Function       ##--
--##     This automatically sends      ##--
--##    vehicles back to the garage    ##--
--##      when they are likely to      ##--
--##       be trapped in "limbo"       ##--
--##                                   ##--
--#######################################--
-------------------------------------------

function ERPG:LoginCheck()
    if not ESX then return; end
    ESX.TriggerServerCallback('ERPG:GetVehicles', function(vehicles)
        for key,val in pairs(vehicles) do
            if val.stored == 0 or val.stored == nil then  
                TriggerServerEvent('ERPG:ChangeState', val.plate, 1)
            end      
        end        
    end)
end

-------------------------------------------
--#######################################--
--##                                   ##--
--##        Garage Update Thread       ##--
--##                                   ##--
--#######################################--
-------------------------------------------

function ERPG:Start()
    if not self then return; end
    if not ESX then 
        while not ESX do Citizen.Wait(100); end
        self.ESX = ESX
    end

    while not ESX.IsPlayerLoaded() do Citizen.Wait(100); end
	print("ERP_Garage:Start() - Successful")

    TriggerServerEvent('ERPG:Startup') 

    self:LoginCheck() 

    self:SetBlips()   

    self:Update() 
end

function ERPG:Update()  
    if not self then return; end
    while true do        
        self.tick = (self.tick or 0) + 1
        self:UpdateMarkers()
        self:CheckInput()

        if self.tick % 100 == 1 then
            self:CheckPosition()
        end
        
        Citizen.Wait(0)
    end
end

Citizen.CreateThread(function(...) ERPG:Start(...); end)
