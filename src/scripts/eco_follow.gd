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

func set_eco_city(value:int):
	eco_town = eco_town + clamp(value, 0, 100)
	return eco_town
func set_eco_beach(value:int):
	eco_beach = eco_beach + clamp(value, 0, 100)
	return eco_beach
func set_eco_forest(value:int):
	eco_forest = eco_forest + clamp(value, 0, 100)
	return eco_forest
func set_eco_farm(value:int):
	eco_farm = eco_farm + clamp(value, 0, 100)
	return eco_farm
func set_eco_port(value:int):
	eco_port = eco_port + clamp(value, 0, 100)
	return eco_port
func set_eco_mountain(value:int):
	eco_mountains = eco_mountains + clamp(value, 0, 100)
	return eco_mountains

func eco_zone(zone: String, value: int):
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
		
		
		
func set_new_eco(zone: String, points:int):
	if zone == "Town":
		set_eco_city(points)
	if zone == "Beach":
		set_eco_beach(points)
	if zone == "Farm":
		set_eco_farm(points)
	if zone == "Forest":
		set_eco_forest(points)
	if zone == "Port":
		set_eco_port(points)
	if zone == "Mountains":
		set_eco_mountain(points)
	eco_zone(zone, points)
