erp_calls = {}

-------------------------------------------------------------------------------
-- Citizen Shortcuts
-------------------------------------------------------------------------------
function erp_calls.Loop(time, thunk)
    if not thunk then
        thunk = time
        time = 0
    end

    Citizen.CreateThread(
        function()
            while true do
                thunk()
                Citizen.Wait(time)
            end
        end)
end
