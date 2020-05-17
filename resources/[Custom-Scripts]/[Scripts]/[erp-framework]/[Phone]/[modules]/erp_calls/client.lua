-------------------------------------------------------------------------------
-- Native Shortcuts
-------------------------------------------------------------------------------
function erp_calls.NetEvent(name, thunk)
    RegisterNetEvent(name)
    AddEventHandler(name, thunk)
end