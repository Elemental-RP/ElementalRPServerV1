-------------------------------------------------------------------------------
-- Native Shortcuts
-------------------------------------------------------------------------------
function erp_calls.Event(name, thunk)
    AddEventHandler(name,
        function(...)
            thunk(source, ...)
        end)
end

function erp_calls.NetEvent(name, thunk)
    RegisterNetEvent(name)
    erp_calls.Event(name, thunk)
end
