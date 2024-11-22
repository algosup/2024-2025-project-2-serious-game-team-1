# Item.gd

extends Interactable

class_name Item

@export var item_name: String = "Default Item"

#var res = Alldictionary.recup_item(item_name)

@onready var rigidbody = self  # Reference to the RigidBody3D itself (assuming this script is attached to a RigidBody3D)

# Called when picked up
func pick_up():
	print(self.name + " picked up")
	Alldictionary.add_item(item_name)
	queue_free()
	
