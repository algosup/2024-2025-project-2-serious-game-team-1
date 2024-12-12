extends Node

var eco_town: float = 35
var eco_beach: float = 0
var eco_forest: float = 0
var eco_farm:float = 0
var inventory: Array = []


var Localisation: Dictionary = {
	"town" : eco_town,
	"beach" : eco_beach,
	"forest" : eco_forest,
	"farm" : eco_farm
}
func set_eco_city(value):
	eco_town = clamp(value, 0, 100)
func set_eco_beach(value):
	eco_beach = clamp(value, 0, 100)
func set_eco_forest(value):
	eco_forest = clamp(value, 0, 100)
func set_eco_farm(value):
	eco_farm = clamp(value, 0, 100)
