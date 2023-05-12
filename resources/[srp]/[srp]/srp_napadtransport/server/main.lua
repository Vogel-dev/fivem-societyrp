---======================---
---Written by Tościk#9715---
---======================---
local potrzebniPolicjanci = 2  		--<< potrzebni policjanci do aktywacji misji
local czastimer = 600 * 1000	    --<< timer co ile mozna robic misje, domyslnie 600 sekund
local gotowkaA = 4500				--<< ile minimum mozesz dostac z rabunku
local gotowkaB = 7500			--<< ile maximum mozesz dostac z rabunku
local KosztAktywacji = 5000 		--<< ile kosztuje aktywacja misji (czystej z banku)
-----------------------------------
local MisjaAktywna = 0
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('napadtransport:akceptujto')
AddEventHandler('napadtransport:akceptujto', function()
	local copsOnDuty = 0
	local Players = ESX.GetPlayers()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local accountMoney = 0
	accountMoney = xPlayer.getAccount('bank').money
if MisjaAktywna == 0 then
	if accountMoney < KosztAktywacji then
	TriggerClientEvent('esx:showNotification', source, '~r~Potrzebujesz 5,000$ w banku aby zaakceptować misję')
	else
	for i = 1, #Players do
        local xPlayer = ESX.GetPlayerFromId(Players[i])
        if xPlayer["job"]["name"] == "police" then
            copsOnDuty = copsOnDuty + 1
        end
    end
	if copsOnDuty >= potrzebniPolicjanci then
		TriggerClientEvent("napadtransport:Pozwolwykonac", _source)
		xPlayer.removeAccountMoney('bank', KosztAktywacji)
		OdpalTimer()
    else
        TriggerClientEvent('esx:showNotification', source, '~r~Potrzeba przynajmniej ~g~'..potrzebniPolicjanci.. '~r~ LSPD aby aktywować misję.')
    end
	end
else
TriggerClientEvent('esx:showNotification', source, '~r~Ktoś już wykonuje tą misje')
end
end)

function OdpalTimer()
MisjaAktywna = 1
Wait(czastimer)
MisjaAktywna = 0
end

RegisterServerEvent('napadtransport:zawiadompsy')
AddEventHandler('napadtransport:zawiadompsy', function(x, y, z) 
    TriggerClientEvent('napadtransport:infodlalspd', -1, x, y, z)
end)

RegisterServerEvent('napadtransport:graczZrobilnapad')
AddEventHandler('napadtransport:graczZrobilnapad', function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
local LosujSiano = math.random(gotowkaA,gotowkaB)
xPlayer.addMoney(LosujSiano)
TriggerClientEvent('esx:showNotification', source, 'Zabierasz ~g~'..LosujSiano..'$~w~ z furgonetki')
Wait(2500)
end)


