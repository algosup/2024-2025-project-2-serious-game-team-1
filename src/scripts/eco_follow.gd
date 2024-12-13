extends Node

var eco_town: float = 0
var eco_beach: float = 0
var eco_forest: float = 0
var eco_farm:float = 0
var eco_port:float = 0
var eco_mountains: float = 0
var inventory: Array = []


var Localisation: Dictionary = {
	"town" : eco_town,
	"beach" : eco_beach,
	"forest" : eco_forest,
	"farm" : eco_farm,
	"port" : eco_port,
	"mountains": eco_mountains,
}

func set_eco_city(value):
	eco_town = clamp(value, 0, 100)
func set_eco_beach(value):
	eco_beach = clamp(value, 0, 100)
func set_eco_forest(value):
	eco_forest = clamp(value, 0, 100)
func set_eco_farm(value):
	eco_farm = clamp(value, 0, 100)

func eco_zone(zone: String, value: float):
	if zone == "Town":
		value = eco_town
	if zone == "Beach":
		value = eco_beach
	if zone == "Farm":
		value = eco_farm
	if zone == "Forest":
		value = eco_forest
	if zone == "Port":
		value = eco_port
	if zone == "Mountains":
		value = eco_mountains
	
	return value
		
