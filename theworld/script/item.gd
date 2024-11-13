# Item.gd
extends Interactable

class_name Item

@export var item_name: String = "Default Item"
var in_hand: bool = false  # Tracks if the item is currently in hand

# Method to enable or disable collision
func set_collision(enabled: bool) -> void:
	var collision = get_node("MainCollision")
	if collision:
		collision.disabled = !enabled
	else:
		print("Warning: MainCollision node not found!")


# Called when picked up
func pick_up():
	in_hand = true
	set_collision(false)  # Disable collision
	print(item_name, "is now in hand")

# Called when placed in inventory or dropped
func store_in_inventory():
	in_hand = false
	set_collision(true)  # Re-enable collision
	print(item_name, "is stored in inventory")
