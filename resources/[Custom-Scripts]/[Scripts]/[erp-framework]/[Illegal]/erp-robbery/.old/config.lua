Config = {}
Translation = {}

Config.Shopkeeper = 416176080 -- hash of the shopkeeper ped
Config.Locale = 'pt'

Config.Shops = {
    -- {coords = vector3(x, y, z), heading = peds heading, money = {min, max}, cops = amount of cops required to rob, blip = true: add blip on map false: don't add blip, name = name of the store (when cops get alarm, blip name etc)}
    {coords = vector3(372.98, 328.19, 103.56-0.98), heading = 250.0, money = {2500, 8500}, cops = 4, blip = false, name = '24/7 (Clinton Avenue)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},    
    {coords = vector3(24.03, -1345.63, 29.5-0.98), heading = 266.0, money = {2500, 8500}, cops = 4, blip = false, name = '24/7 (Boulevard)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},    
	{coords = vector3(1134.214, -982.95, 46.41-0.98), heading = 277.0, money = {2500, 8500}, cops = 4, blip = false, name = 'Liquor (El Rancho Boulevard)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-1486.58, -377.59, 40.16-0.98), heading = 136.0, money = {2500, 8500}, cops = 4, blip = false, name = 'Liquor (Prosperity Street)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-1221.48, -908.07, 12.32-0.98), heading = 29.0, money = {2500, 8500}, cops = 4, blip = false, name = 'Liquor (San Andreas Avenue)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-47.65, -1758.94, 29.52-0.98), heading = 47.0, money = {2500, 8500}, cops = 4, blip = false, name = 'LTD (Grove Street)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-47.65, -1758.94, 29.52-0.98), heading = 47.0, money = {2500, 8500}, cops = 4, blip = false, name = 'LTD (Grove Street)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1165.00, -324.38, 69.20-0.98), heading = 99.0, money = {2500, 8500}, cops = 4, blip = false, name = 'LTD (West Mirror Drive)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-705.73, -914.91, 19.22-0.98), heading = 91.0, money = {2500, 8500}, cops = 4, blip = false, name = 'LTD (Linger Circus)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(2555.383, 380.906, 108.62-0.98), heading = 351.0, money = {2500, 8500}, cops = 4, blip = false, name = '24/7 (Palomino Freeway)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-1819.12, 793.08, 138.08-0.98), heading = 131.0, money = {2500, 8500}, cops = 4, blip = false, name = 'LTD (Banham Canyon Drive)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-2966.32, 391.34, 15.04-0.98), heading = 01.0, money = {2500, 8500}, cops = 4, blip = false, name = 'Liquor (Great Ocean Highway)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-3040.77, 583.98, 7.90-0.98), heading = 14.0, money = {2500, 8500}, cops = 4, blip = false, name = '24/7 (Ineseno Road)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-3244.16, 1000.08, 12.83-0.98), heading = 351.0, money = {2500, 8500}, cops = 4, blip = false, name = '24/7 (Barbareno Road)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(549.27, 2669.56, 42.15-0.98), heading = 96.0, money = {2500, 8500}, cops = 4, blip = false, name = '24/7 (Route 68)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1165.341, 2710.84, 38.15-0.98), heading = 185.0, money = {2500, 8500}, cops = 4, blip = false, name = 'Liquor (Route 68)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(2676.455, 3280.30, 55.24-0.98), heading = 326.0, money = {2500, 8500}, cops = 4, blip = false, name = '24/7 (Senora Freeway)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1392.30, 3606.27, 34.98-0.98), heading = 200.0, money = {2500, 8500}, cops = 4, blip = false, name = 'Liquor (Algonquin Boulevard)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1959.18, 3741.64, 32.34-0.98), heading = 298.0, money = {2500, 8500}, cops = 4, blip = false, name = '24/7 (Nidaland Abenue)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1728.61, 6416.87, 35.03-0.98), heading = 242.0, money = {2500, 8500}, cops = 4, blip = false, name = '24/7 (Senora Freeway)', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false}
}

Translation = {
    ['en'] = {
        ['shopkeeper'] = 'shopkeeper',
        ['robbed'] = "I was just robbed and ~r~don't ~w~have any money left!",
        ['cashrecieved'] = 'You got:',
        ['currency'] = '$',
        ['scared'] = 'Scared:',
        ['no_cops'] = 'There are ~r~not~w~ enough cops online!',
        ['cop_msg'] = 'We have sent a photo of the robber taken by the CCTV camera!',
        ['set_waypoint'] = 'Set waypoint to the store',
        ['hide_box'] = 'Close Notification',
        ['robbery'] = 'Robbery in progress',
        ['walked_too_far'] = 'You walked too far away!'
    },
    ['pt'] = {
        ['shopkeeper'] = 'Lojista',
        ['robbed'] = "A loja foi assaltada recentemente!",
        ['cashrecieved'] = 'Recebeste:',
        ['currency'] = '€',
        ['scared'] = 'Assustado:',
        ['no_cops'] = 'Não ~r~há~w~ polícias suficientes!',
        ['cop_msg'] = 'Enviamos uma foto do ladrão tirada pela câmera de CCTV!',
        ['set_waypoint'] = 'Inserir GPS para a loja',
        ['hide_box'] = 'Fechar a Notificação',
        ['robbery'] = 'Roubo em progresso',
        ['walked_too_far'] = 'Falaste demasiado longe!'
    }
}