# Item.gd

extends Interactable

class_name Item

@export var item_name: String = "Default Item"


@onready var rigidbody = self  # Reference to the RigidBody3D itself (assuming this script is attached to a RigidBody3D)

# Called when picked up
func pick_up():
	print(self.name + " picked up")
	EcoFollow.add_to_inventory(self)
	queue_free()
	
