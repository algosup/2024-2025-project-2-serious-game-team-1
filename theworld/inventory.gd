extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func open_inventory():
	PlayMenu.hide()
	Inventory.hide()
	Variable.InventoryOpen = true
	Variable.pause_character()

func close_inventory():
	PlayMenu.hide()
	Inventory.hide()
	Variable.InventoryOpen = false
	Variable.resume_character()
