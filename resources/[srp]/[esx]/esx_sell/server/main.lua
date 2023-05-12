--TA PACZKA JEST DARMOWA ZNAJDZIESZ JĄ NA MOIM KANALE--
--https://youtube.com/c/aries98--

--#################################################--

---WAZNE GOSTECZKU PRZECZYTAJ TO U GÓRY--
--TA PACZKA JEST DARMOWA ZNAJDZIESZ JĄ NA MOIM KANALE--
--https://youtube.com/c/aries98--

--#################################################--

---WAZNE GOSTECZKU PRZECZYTAJ TO U GÓRY--
--TA PACZKA JEST DARMOWA ZNAJDZIESZ JĄ NA MOIM KANALE--
--https://youtube.com/c/aries98--

--#################################################--

---WAZNE GOSTECZKU PRZECZYTAJ TO U GÓRY--
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('esx-qalle-vehicleresell:proposeDeal')
AddEventHandler('esx-qalle-vehicleresell:proposeDeal', function(closestPlayer, plate, price)
    local target = ESX.GetPlayerFromId(closestPlayer)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll(
        'SELECT * FROM owned_vehicles WHERE plate = @plate and owner = @identifier', {['@plate'] = plate, ['@identifier'] = xPlayer.identifier},
    function(result)
        if result[1] ~= nil then
            TriggerClientEvent('esx-qalle-vehicleresell:proposedDeal', target.source, price, plate)
        end
    end)
end)

RegisterServerEvent('esx-qalle-vehicleresell:acceptDeal')
AddEventHandler('esx-qalle-vehicleresell:acceptDeal', function(plate, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    local bankAccount = xPlayer.getAccount('bank').money
    if bankAccount >= tonumber(price) then
        MySQL.Async.fetchAll(
            'SELECT * FROM owned_vehicles WHERE plate = @plate', {['@plate'] = plate},
            function(result)
                
            if result[1] ~= nil then
                MySQL.Async.execute('UPDATE owned_vehicles SET owner= @identifier WHERE plate = @plate',
                  {
                    ['@plate'] = plate,
                    ['@identifier'] = xPlayer.identifier
                  }
                )
            end

            giveMoney(result[1].owner, price)
        end)

        xPlayer.removeAccountMoney('bank', tonumber(price))
        sendNotification(source, 'Zapłaciłeś: ' ..price.. ' w zamian za ' ..plate)
    else
        sendNotification(source, 'Nie stać cię na kupno')
    end
end)


function giveMoney(owner, price)

    local xPlayer = ESX.GetPlayerFromIdentifier(owner)

             if xPlayer ~= nil then
        xPlayer.addAccountMoney('bank', tonumber(price))
    end
end



--notification
function sendNotification(xSource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xSource, message)
end