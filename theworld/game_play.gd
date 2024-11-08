extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Escape"):
		if Variable.InventoryOpen:
			Inventory.close_inventory()
		else:
			if Variable.isPaused == false:
				pause_game()
			else:
				resume_game()
	if Input.is_action_just_pressed("Inventory"):
		if Variable.InventoryOpen:
			Inventory.close_inventory()
		else:
			Inventory.open_inventory()

func resume_game():
	Variable.UnPause()
	if not Variable.MouseCapture:
			Variable.CaptureMouseOn()
	print("Resume Game")
	PlayMenu.ClosePlayMenu()

func pause_game():
	Variable.Pause()
	if Variable.MouseCapture:
			Variable.CaptureMouseOff()
	print("Pause Game")
	PlayMenu.OpenPlayMenu()
