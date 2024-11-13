extends Node3D


func _ready() -> void:
	pass
	


func _process(_delta: float):
	if Input.is_action_just_pressed("escape"):
		if Variable.InventoryOpen:
			Inventory.CloseInventory()
		else:
			if Variable.isPaused == false:
				pause_game()
			else:
				resume_game()
	

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
