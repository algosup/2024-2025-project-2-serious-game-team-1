extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Variable.InventoryOpen:
		$".".show()
		Variable.pause_character()
		if Variable.MouseCapture:
			Variable.CaptureMouseOff()
	else:
		$".".hide()
		Variable.resume_character()
		if not Variable.MouseCapture:
			Variable.CaptureMouseOn()

func open_inventory():
	Variable.InventoryOpen = true

func close_inventory():
	Variable.InventoryOpen = false
