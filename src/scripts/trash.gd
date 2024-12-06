extends Interactable

class_name Waste

@export var waste_name: String = "Default Waste"
@export var no_bin_bag_message: String = "You need a Bin bag!"

func cleanup():
	# Print the inventory contents for debugging
	print("Inventory contents:", AllDictionary.inventory)
	# Check if "bin bag" exists in the autoload inventory
	if "Bin bag" in AllDictionary.inventory:
		print("Cleaning up", waste_name)
		EcoFollow.set_eco_beach(10)
		print(EcoFollow.eco_beach)
		queue_free()  # Remove the waste item from the scene
	else:
		print(no_bin_bag_message)  # Print message if bin bag is missing
		prompt_message = no_bin_bag_message
