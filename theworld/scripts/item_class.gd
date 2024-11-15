extends Resource
class_name Item

@export var title : String
@export var icon : Texture2D
@export_multiline var description : String


func pick_up():
	#Credit Matteo 
	print(self.title + "picked up")
	InventoryGestion.add_to_inventory(self)
