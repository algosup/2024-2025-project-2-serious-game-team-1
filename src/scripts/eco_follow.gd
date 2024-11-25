extends Node

var eco_city: float = 0
var eco_beach: float = 0
var eco_forest: float = 0
var eco_farm:float = 0
var inventory: Array = []

func set_eco_city(value):
	eco_city = clamp(value, 0, 100)
func set_eco_beach(value):
	eco_beach = clamp(value, 0, 100)
func set_eco_forest(value):
	eco_forest = clamp(value, 0, 100)
func set_eco_farm(value):
	eco_farm = clamp(value, 0, 100)
# Adds a simple string name of the item to the inventory if it's not already there
func add_to_inventory(item: Item_Object):
	if item.name not in inventory:
		inventory.append(item.name)
		print("Added ", item.name, " to inventory.")
		item.pick_up()
	else:
		print(item.name, "is already in inventory.")
