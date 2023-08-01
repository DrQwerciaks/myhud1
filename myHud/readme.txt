Thanks for downloading the script!
For support and further updates you can join my Discord: https://discord.gg/UyAu2jABzE

Installation:
1.) Put the script in your ressources folder
2.) Set up the Config.lua
3.) Do the changes in esx_status described below
4.) Add 'start myHud' to your server.cfg

Necessarry changes:
Go to esx_status/client/main.lua and search for: esx_status:load

Then add: 
TriggerEvent('myHUD:updateStatus', GetStatusData(true))
before
Citizen.Wait(Config.TickTime)
so it looks like this:


RegisterNetEvent('esx_status:load')
AddEventHandler('esx_status:load', function(status)
	for i=1, #Status, 1 do
		for j=1, #status, 1 do
			if Status[i].name == status[j].name then
				Status[i].set(status[j].val)
			end
		end
	end

	Citizen.CreateThread(function()
		while true do
			for i=1, #Status, 1 do
				Status[i].onTick()
			end

			SendNUIMessage({
				update = true,
				status = GetStatusData()
			})
	
			TriggerEvent('esx_status:onTick', GetStatusData(true))
			TriggerEvent('myHUD:updateStatus', GetStatusData(true))
			Citizen.Wait(Config.TickTime)
		end
	end)
end)

