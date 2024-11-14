extends Node3D

func _ready() -> void:
	pass

func _input(_event):
	if Input.is_action_just_pressed("escape"):
		if Variable.InventoryOpen == true:
			Inventory.CloseInventory()
		else:
			if Variable.isPaused == false:
				pause_game()
				print("Open PlayMenu")
			else:
				resume_game()
				print("Close PlayMenu")
	if Input.is_action_just_pressed("inventory"):
		if Variable.InventoryOpen == true:
			Inventory.CloseInventory()
		else:
			Inventory.OpenInventory()

	if Input.is_action_just_pressed("interact"):
		print("Interact")

func resume_game():
	Variable.UnPause()
	Variable.CaptureMouseOn()
	print("Resume Game")
	PlayMenu.ClosePlayMenu()

func pause_game():
	Variable.Pause()
	Variable.CaptureMouseOff()
	print("Pause Game")
	PlayMenu.OpenPlayMenu()
