# myhud1

Pieniądze
Zasięg głosu
Zdrowie
Głód
Pragnienie
Alkohol
W pliku Config.lua możesz po prostu wyłączyć / włączyć zdrowie, zasięg głosu i pieniądze, aby jak najłatwiej dostosować HUD do swoich przekonań.

Dodatkowo znajdują się tam objaśnienia dotyczące prostej edycji kolorów i grubości paska postępu HUD!

 

Jeśli chodzi o zakres głosu:

Ponieważ istnieje mnóstwo różnych sposobów na czat głosowy, musisz dodać proste zdarzenie do czatu głosowego, gdy zakres głosu zostanie zmieniony. Zdarzenie jest wywoływane: TriggerEvent("myHUD:updateVoiceRange", progress). -> Zamiast postępu dodaj tam swój zakres głosu.

Jeśli nie chcesz używać funkcji zakresu głosu w ogóle, po prostu wyłącz to w Config.lua.

 

Zależności:

esx_status (musisz dodać zdarzenie do esx_status -> całkowicie wyjaśnione w readme.txt)
esx_basicneeds
![image](https://github.com/DrQwerciaks/myhud1/assets/77661984/99c20403-5c8a-4da8-8914-99e8e449b1fb)




Instalacja:
1.) Umieść skrypt w folderze ressources
2.) Skonfiguruj Config.lua
3.) Dokonaj zmian w esx_status opisanych poniżej
4.) Dodaj "start myHud" do pliku server.cfg.

Niezbędne zmiany:
Przejdź do esx_status/client/main.lua i wyszukaj: esx_status:load

Następnie dodaj: 
TriggerEvent('myHUD:updateStatus', GetStatusData(true))
before
Citizen.Wait(Config.TickTime)
więc wygląda to tak:


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


