extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Variable.InventoryOpen:
		$".".show()
		Variable.pause_character()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		$".".hide()
		Variable.resume_character()
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func open_inventory():
	Variable.InventoryOpen = true

func close_inventory():
	Variable.InventoryOpen = false
