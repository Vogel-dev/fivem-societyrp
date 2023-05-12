petrolCanPrice = 1

lang = "en"
-- lang = "fr"

settings = {}
settings["en"] = {
	openMenu = "Naciśnij ~g~E~w~, aby otworzyć menu tankowania.",
	electricError = "~r~Podjedź na inne stanowisko.",
	fuelError = "~r~Podjedź na inne stanowisko.",
	buyFuel = "Kup paliwo",
	liters = "Litry:",
	percent = "Poziom naładowania",
	confirm = "Potwierdź",
	fuelStation = "Stacja Paliw",
	boatFuelStation = "Stacja Paliw | Łodzie",
	avionFuelStation = "Stacja Paliw | Samoloty ",
	heliFuelStation = "Stacja Paliw | Helikoptery",
	getJerryCan = "Naciśnij ~g~E~w~, aby kupić kanister z paliwem ("..petrolCanPrice.."$)",
	refeel = "Naciśnij ~g~E~w~, to refuel the car.",
	YouHaveBought = "Kupiłeś ",
	fuel = " Litry paliwa",
	price = "Cena"
}

--settings["fr"] = {
--	openMenu = "Appuyez sur ~g~E~w~ pour ouvrir le menu.",
--	electricError = "~r~Vous avez une voiture électrique.",
--	fuelError = "~r~Vous n'êtes pas au bon endroit.",
--	buyFuel = "acheter de l'essence",
--	liters = "litres",
--	percent = "pourcent",
--	confirm = "Valider",
--	fuelStation = "Station essence",
--	boatFuelStation = "Station d'essence | Bateau",
--	avionFuelStation = "Station d'essence | Avions",
--	heliFuelStation = "Station d'essence | Hélicoptères",
--	getJerryCan = "Appuyez sur ~g~E~w~ pour acheter un bidon d'essence ("..petrolCanPrice.."$)",
--	refeel = "Appuyez sur ~g~E~w~ pour remplir votre voiture d'essence.",
--	YouHaveBought = "Vous avez acheté ",
--	fuel = " litres d'essence",
--	price = "prix"
--}


showBar = false
showText = true


hud_form = 1 -- 1 : Vertical | 2 = Horizontal
hud_x = 0.175 
hud_y = 0.885

text_x = 0.223
text_y = 0.9217


electricityPrice = 1 -- NOT RANOMED !!

randomPrice = true --Random the price of each stations
price = 25 --If random price is on False, set the price here for 1 liter