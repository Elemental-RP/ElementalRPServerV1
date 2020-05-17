ESX = nil
Citizen.CreateThread(function() while true do Wait(5) if ESX ~= nil then else ESX = nil TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) end end end)
local isDead = false

rootMenuConfig =  {
    {
        id = "general",
        displayName = "Geral",
        icon = "#globe-europe",
        enableMenu = function()
            return not isDead
        end,
        subMenus = {"general:flipvehicle",  "general:ccdar", "general:ccver",  "general:sellcar",  "general:emotes", "general:openinv", "general:openphone"  }
    },
    {
        id = "police-action",
        displayName = "Ações da Polícia",
        icon = "#police-action",
        enableMenu = function()
            local ped = PlayerPedId()
            PlayerData = ESX.GetPlayerData()
            if PlayerData.job.name == "police" and not isDead then
                return true
            end
        end,
        subMenus = { "police:cuff", "police:uncuff", "police:putinvehicle", "police:unseatnearest", "police:openmdt", "police:getid", "police:searchinv", "police:seebills","police:checklicenses" }
    },
    {
        id = "animations",
        displayName = "Anim/Gestos rápidos",
        icon = "#walking",
        enableMenu = function()
            return not isDead
        end,
        subMenus = { "anim:bracos", "anim:nao", "anim:palmas", "anim:encostar","anim:cintura", "anim:deitar", "anim:teclar", "anim:continencia", "anim:manguito", "anim:paz", "anim:facepalm", "anim:bolas", "anim:fumar", "anim:sentarchao", "anim:sentarcadeira", "anim:policia", "anim:render" }
    },
    {
        id = "props",
        displayName = "Props rápidas",
        icon = "#props",
        enableMenu = function()
            return not isDead
        end,
        subMenus = { "props:mala", "props:cafe", "props:gchuva", "props:notepad"}
    }
}

newSubMenus = {
    --------------------- General Stuff
    ['general:emotes'] = {
        title = "Emotes",
        icon = "#general-emotes",
        functionName = "dp:RecieveMenu"
    },
    ['general:sellcar'] = {
        title = "Vender Carro",
        icon = "#general-keys-give",
        functionName = "general:sellcar"
    },
    ['general:ccver'] = {
        title = "Ver CC",
        icon = "#general-ccver",
        functionName = "general:ccver"
    },
    ['general:ccdar'] = {
        title = "Dar CC",
        icon = "#general-ccdar",
        functionName = "general:ccdar"
    },
    ['general:flipvehicle'] = {
        title = "Virar Veículo",
        icon = "#general-flip-vehicle",
        functionName = "FlipVehicle"
    },
    ['general:openphone'] = {
        title = "Abrir Telemovel",
        icon = "#general-openphone",
        functionName = "general:openphone"
    },
    ['general:openinv'] = {
        title = "Abrir Inventario",
        icon = "#general-openinv",
        functionName = "general:openinv"
    },
    --------------------- Animations Stuff
    ['anim:bracos'] = {
        title = "Braços",
        icon = "#anim-bracos",
        functionName = "animgest:bracos"
    },
    ['anim:nao'] = {
        title = "Não",
        icon = "#anim-nao",
        functionName = "animgest:nao"
    },
    ['anim:palmas'] = {
        title = "Palmas",
        icon = "#anim-palmas",
        functionName = "animgest:palmas"
    },
    ['anim:encostar'] = {
        title = "Encostar",
        icon = "#anim-encostar",
        functionName = "animgest:encostar"
    },
    ['anim:cintura'] = {
        title = "Cintura",
        icon = "#anim-cintura",
        functionName = "animgest:cintura"
    },
    ['anim:continencia'] = {
        title = "Continencia",
        icon = "#anim-continencia",
        functionName = "animgest:continencia"
    },
    ['anim:teclar'] = {
        title = "Teclar",
        icon = "#anim-teclar",
        functionName = "animgest:teclar"
    },
    ['anim:deitar'] = {
        title = "Deitar",
        icon = "#anim-deitar",
        functionName = "animgest:deitar"
    },
    ['anim:manguito'] = {
        title = "Manguito",
        icon = "#anim-manguito",
        functionName = "animgest:manguito"
    },
    ['anim:paz'] =
    {
        title = "Paz",
        icon = "#anim-paz",
        functionName = "animgest:paz"
    },
    ['anim:facepalm'] = {
        title = "Face Palm",
        icon = "#anim-facepalm",
        functionName = "animgest:facepalm"
    },
    ['anim:bolas'] = {
        title = "Bolas",
        icon = "#anim-bolas",
        functionName = "animgest:bolas"
    },
    ['anim:fumar'] = {
        title = "Fumar",
        icon = "#anim-fumar",
        functionName = "animgest:fumar"
    },
    ['anim:sentarchao'] = {
        title = "Sentar no Chão",
        icon = "#anim-sentarchao",
        functionName = "animgest:sentarchao"
    },
    ['anim:sentarcadeira'] = {
        title = "Sentar na Cadeira",
        icon = "#anim-sentarcadeira",
        functionName = "animgest:sentarcadeira"
    },
    ['anim:policia'] = {
        title = "Policia",
        icon = "#anim-policia",
        functionName = "animgest:policia"
    },
    ['anim:render'] = {
        title = "Render",
        icon = "#anim-render",
        functionName = "animgest:render"
    },
    --------------------- Props Stuff
    ['props:gchuva'] = {
        title = "Guarda Chuva",
        icon = "#props-gchuva",
        functionName = "props:gchuva"
    },
    ['props:mala'] = {
        title = "Mala",
        icon = "#props-mala",
        functionName = "props:mala"
    },
    ['props:cafe'] = {
        title = "Café",
        icon = "#props-cafe",
        functionName = "props:cafe"
    },
    ['props:notepad'] = {
        title = "Bloco de Notas",
        icon = "#props-notepad",
        functionName = "props:notepad"
    },
    --------------------- Police Stuff
    ['police:cuff'] = {
        title = "Algemar",
        icon = "#cuffs-cuff",
        functionName = "p:arrest"
    },
    ['police:uncuff'] = {
        title = "Desalgemar",
        icon = "#cuffs-uncuff",
        functionName = "p:unrrest"
    },
    ['police:putinvehicle'] = {
        title = "Meter no Carro",
        icon = "#general-put-in-veh",
        functionName = "p:putinveh"
    },
    ['police:unseatnearest'] = {
        title = "Tirar do Carro",
        icon = "#general-unseat-nearest",
        functionName = "p:getoutveh"
    },  
    ['police:searchinv'] = {
        title = "Procurar",
        icon = "#cuffs-check-inventory",
        functionName = "p:searchinv"
    },
    ['police:checklicenses'] = {
        title = "Gerir Liçensas",
        icon = "#police-check-licenses",
        functionName = "p:checkLicenses"
    },
    ['police:openmdt'] = {
        title = "MDT",
        icon = "#mdt",
        functionName = "openmdt"
    },
    ['police:getid'] = {
        title = "Obter ID",
        icon = "#police-vehicle-plate",
        functionName = "p:getid"
    },
    ['police:seebills'] = {
        title = "Ver Faturas",
        icon = "#police-vehicle-plate",
        functionName = "p:seebills"
    }
}

AddEventHandler('playerSpawned', function(spawn) isDead = false end)
AddEventHandler('esx:onPlayerDeath', function(data) isDead = true end)
