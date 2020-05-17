local decors = {
    {
        ["decorName"] = "inInstance",
        ["decorType"] = 2
    },
    {
        ["decorName"] = "currentInstance",
        ["decorType"] = 3
    }
}

for decorIndex, decorData in ipairs(decors) do
    DecorRegister(decorData["decorName"], decorData["decorType"])
end