# Item.gd

extends Interactable

class_name Item_Object

@export var item_ressource: Item_Ressource  # Reference to the associated resource

@onready var rigidbody = self  # Reference to the RigidBody3D itself (assuming this script is attached to a RigidBody3D)

# Called when picked up
func pick_up():
	print(self.name + " picked up")
	AllDictionary.check_item(self, item_ressource)

func disappear():
	$".".set_gravity_scale(0)
	$CollisionShape3D.disabled = true
	$CollisionShape3D/bin_bag_mesh.hide()

func appear():
	$".".set_gravity_scale(1)
	$CollisionShape3D.disabled = false
	$CollisionShape3D/bin_bag_mesh.show()
