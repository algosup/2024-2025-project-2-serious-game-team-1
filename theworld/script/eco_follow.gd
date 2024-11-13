extends Node

var eco_city: float = 0
var eco_beach: float = 0
var eco_forest: float = 0
var eco_farm:float = 0

func set_eco_city(value):
	eco_city = clamp(value, 0, 100)
	eco_beach = clamp(value, 0, 100)
	eco_forest = clamp(value, 0, 100)
	eco_farm = clamp(value, 0, 100)

# New variable for holding an item in hand
var item_in_hand: Item = null  # Null if no item is held

# Setter methods for eco variables...

func add_to_inventory(item: Item) -> bool:
	# If there's an item in hand, add the new item to inventory
	if item_in_hand:
		print("Item goes to inventory: ", item.item_name)
		item.store_in_inventory()
		return true
	else:
		# If no item in hand, hold this item
		item_in_hand = item
		item.pick_up()
		print("Item in hand:", item.item_name)
		return false  # Not stored in inventory, just picked up
