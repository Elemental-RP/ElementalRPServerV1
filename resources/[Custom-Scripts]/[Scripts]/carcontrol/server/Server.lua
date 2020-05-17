local res = GetCurrentResourceName()
Awake = function(...)
  if not Config.Receipt or Config.Receipt == "CHANGEME" then print('\27[31m['..res.."]\27[0m You need to set your receipt number in the Config."); return
  elseif Config.Receipt:len() ~= 4 then print('\27[31m['..res.."]\27[0m Your receipt must only be 4 characters long."); return
  elseif not res then print('\27[31m['..res.."]\27[0m Error getting resource name."); return
  else TriggerEvent(res..":Awake",Config.Receipt); return
  end
end 

Start = function(...)
  local ret = utils.perf(...)
  if not ret then print('\27[31m['..res.."]\27[0m Unauthorized usage.")
  else 
    print('\27[32m['..res.."]\27[0m Authorized.")
    if cCtrl.__VERSION then
      if Config.__VERSION then
        if cCtrl.__VERSION ~= Config.__VERSION then
          print('\27[32m['..res.."]\27[0m You aren't using the latest update. [\27[31m"..Config.__VERSION.."\27[0m / \27[32m"..cCtrl.__VERSION.."\27[0m]")
        end
      else
        print('\27[32m['..res.."]\27[0m You aren't using the latest update. [\27[31mUNKNOWN\27[0m / \27[32m"..cCtrl.__VERSION.."\27[0m]")
      end
    else
      print('\27[32m['..res.."]\27[0m You aren't using the latest update. [\27[31m"..Config.__VERSION.."\27[0m / \27[32mUNKNOWN\27[0m]")
    end
  end
end  

AddEventHandler(res..":Startup", Start)
Citizen.CreateThread(Awake)