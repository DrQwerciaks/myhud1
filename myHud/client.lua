ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()

  Citizen.Wait(100)
  if Config.showVoiceRangeInHud then
    SendNUIMessage({action = "toggleVoice", show = true})
  else
    SendNUIMessage({action = "toggleVoice", show = false})
  end

  if Config.showMoneyInHud then
    SendNUIMessage({action = "toggleMoney", show = true})
  else
    SendNUIMessage({action = "toggleMoney", show = false})
  end

  if Config.showHealthInHud then
    SendNUIMessage({action = "toggleHeart", show = true})
  else
    SendNUIMessage({action = "toggleHeart", show = false})
  end

  while true do
    Citizen.Wait(1)

    if IsPauseMenuActive() and not IsPaused then
	    IsPaused = true
      SendNUIMessage({action = "toggle", show = false})
    elseif not IsPauseMenuActive() and IsPaused then
      IsPaused = false
      SendNUIMessage({action = "toggle", show = true})
    end

  end
end)

local statushud = true

RegisterCommand('togglehud', function(source, args, raw)
  if statushud == true then
    SendNUIMessage({action = "toggle", show = false})
    statushud = false
  elseif statushud == false then
    SendNUIMessage({action = "toggle", show = true})
    statushud = true
  end
end, false)

RegisterNetEvent('myHUD:updateStatus')
AddEventHandler('myHUD:updateStatus', function(status)
  SendNUIMessage({action = "updateStatus", status = status})

  if status[3].percent > 0 then
	  SendNUIMessage({action = "toggleDrunk", show = true})
  else
    SendNUIMessage({action = "toggleDrunk", show = false})
  end
  
end)

RegisterNetEvent('myHUD:updateVoiceRange')
AddEventHandler('myHUD:updateVoiceRange', function(voiceRange)
	
	SendNUIMessage({action = "updateVoicerange", range = voiceRange * Config.VoiceRangeMultiplier})

end)

RegisterNetEvent('myHUD:updateMoney')
AddEventHandler('myHUD:updateMoney', function(moneyResult)
  SendNUIMessage({action = "updateMoney", money = moneyResult})
end)

-- RegisterNetEvent('myHUD:updateBlackMoney')
-- AddEventHandler('myHUD:updateBlackMoney', function(moneyResult)
--   SendNUIMessage({action = "updateBlackMoney", money = moneyResult})
-- end)

Citizen.CreateThread(function()
  while true do
    SendNUIMessage({action = "updateHeart", lives = GetEntityHealth(PlayerPedId()) - 100})
	-- GetEntityHealth(PlayerPedId()) - 100
    Citizen.Wait(300)
  end
end)

--[[
RegisterNetEvent('SaltyChat_UpdateUI')
AddEventHandler('SaltyChat_UpdateUI', function(voiceRange)
	
	SendNUIMessage({action = "updateVoicerange", range = voiceRange * 4})

end)--]]


RegisterNetEvent('SaltyChat_VoiceRangeChanged')
AddEventHandler('SaltyChat_VoiceRangeChanged', function(voiceRange)
	--print(tonumber(handler) .. ' - ' .. tonumber(GetPlayerServerId(PlayerId())))
	SendNUIMessage({action = "updateVoicerange", range = voiceRange * Config.VoiceRangeMultiplier})
	
end)



