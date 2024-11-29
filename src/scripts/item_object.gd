# Item.gd

extends Interactable

class_name Item_Object

@export var item_ressource: Item_Ressource  # Reference to the associated resource

@onready var rigidbody = self  # Reference to the RigidBody3D itself (assuming this script is attached to a RigidBody3D)

# Called when picked up
func pick_up():
	print(self.name + " picked up")
	AllDictionary.check_item(self,item_ressource)
	
