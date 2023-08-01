
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.showMoneyInHud then
    Citizen.CreateThread(function()
        while true do
            local xPlayers    = ESX.GetPlayers()
            for i=1, #xPlayers, 1 do
                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                --print(xPlayer.source .. ' ' ..  xPlayer.getMoney())
                --if not Config.showBlackMoneyInHud then
                    TriggerClientEvent('myHUD:updateMoney', xPlayer.source, xPlayer.getMoney())
                --else
                --    TriggerClientEvent('myHUD:updateBlackMoney', xPlayer.source, xPlayer.getMoney())
                --end
            end

            Citizen.Wait(2000)
        end
    end)
end


-- function checkMoney(identifier)

--     local moneyPlayer = executeMySQL("SELECT `money` FROM `users` WHERE `identifier` = '"..identifier.."'")
--     return moneyPlayer

-- end

-- function executeMySQL(queryString)
--     local doing = true -- IMPORTANT! 
--     local result = nil

--     MySQL.Async.fetchAll(queryString, {}, function(data)
--         result = data
--         doing = false
--     end)

--     while doing do
--         Citizen.Wait(0)
--     end

--     return result
-- end