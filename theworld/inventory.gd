extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func open_inventory():
	Variable.InventoryOpen = true
	$".".show()
	if Variable.MouseCapture:
		Variable.CaptureMouseOff()

func close_inventory():
	Variable.InventoryOpen = false
	$".".hide()
	if not Variable.MouseCapture:
		Variable.CaptureMouseOn()
