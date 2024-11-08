extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	print("Resume Game")
	PlayMenu.ClosePlayMenu()
	Inventory.close_inventory()

func pause_game():
	Variable.Pause()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	print("Pause Game")
	PlayMenu.OpenPlayMenu()
	Inventory.close_inventory()
