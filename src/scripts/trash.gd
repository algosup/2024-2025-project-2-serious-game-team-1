extends Interactable

class_name Waste

@export var waste_name: String = "Default Waste"
@export var no_bin_bag_message: String = "You need a Bin bag!"
var bin_bag = preload("res://assets/items/bin_bag.tres")

func cleanup():
	var quest
	# Print the inventory contents for debugging
	print("Inventory contents:", AllDictionary.inventory)
	# Check if "bin bag" exists in the autoload inventory
	if bin_bag in AllDictionary.inventory:
		print("Cleaning up", waste_name)
		EcoFollow.set_eco_beach(10)
		print(EcoFollow.eco_beach)
		if AllDictionary.active_main_quests.has("Clean Beach") or AllDictionary.active_secondary_quests.has("Clean Beach"):
			quest = load("res://assets/quests/clean_beach.tres")
			quest.add_counter()
		queue_free()  # Remove the waste item from the scene
	else:
		print(no_bin_bag_message)  # Print message if bin bag is missing
		prompt_message = no_bin_bag_message
