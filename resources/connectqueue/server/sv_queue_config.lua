Config = {}

-- priority list can be any identifier. (hex steamid, steamid32, ip) Integer = power over other people with priority
-- a lot of the steamid converting websites are broken rn and give you the wrong steamid. I use https://steamid.xyz/ with no problems.
-- you can also give priority through the API, read the examples/readme.
Config.Priority = {
    ["steam:110000134a9f03c"] = 100, --blackzon
    ["steam:1100001159049d4"] = 100, --sof
    ["steam:110000131dab704"] = 100, --lord
    ["steam:11000010bfe8705"] = 75
}

-- require people to run steam
Config.RequireSteam = true

-- "whitelist" only server
Config.PriorityOnly = false

-- disables hardcap, should keep this true
Config.DisableHardCap = false

-- will remove players from connecting if they don't load within: __ seconds; May need to increase this if you have a lot of downloads.
-- i have yet to find an easy way to determine whether they are still connecting and downloading content or are hanging in the loadscreen.
-- This may cause session provider errors if it is too low because the removed player may still be connecting, and will let the next person through...
-- even if the server is full. 10 minutes should be enough
Config.ConnectTimeOut = 600

-- will remove players from queue if the server doesn't recieve a message from them within: __ seconds
Config.QueueTimeOut = 90

-- will give players temporary priority when they disconnect and when they start loading in
Config.EnableGrace = false

-- how much priority power grace time will give
Config.GracePower = 5

-- how long grace time lasts in seconds
Config.GraceTime = 480

-- on resource start, players can join the queue but will not let them join for __ milliseconds
-- this will let the queue settle and lets other resources finish initializing
Config.JoinDelay = 30000

-- will show how many people have temporary priority in the connection message
Config.ShowTemp = false

-- simple localization
Config.Language = {
    joining = "\xF0\x9F\x8E\x89A Entrar...",
    connecting = "\xE2\x8F\xB3A Connectar...",
    idrr = "\xE2\x9D\x97[Queue] Erro: Não foi possível recuperar nenhum dos seus IDs, tente reiniciar.",
    err = "\xE2\x9D\x97[Queue] Houve um erro",
    pos = "\xF0\x9F\x90\x8CEstás %d/%d na queue \xF0\x9F\x95\x9C%s",
    connectingerr = "\xE2\x9D\x97[Queue] Erro: Erro ao adicionar-te à lista de conexão",
    timedout = "\xE2\x9D\x97[Queue] Erro: Tempo esgotado?",
    wlonly = "\xE2\x9D\x97[Queue] Deves estar na lista de permissões para entrar neste servidor",
    steam = "\xE2\x9D\x97 [Queue] Erro: Tens de ter a STEAM aberta"
}
