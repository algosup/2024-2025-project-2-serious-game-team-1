extends Node3D

@onready var menu = InventoryGestion

func _ready() -> void:
	menu.hide()

func _input(_event):
	if Input.is_action_just_pressed("escape"):
		if Variable.InventoryOpen == true:
			InventoryGestion.CloseInventory()
		else:
			if Variable.isPaused == false:
				print("Open PlayMenu")
				pause_game()
			else:
				print("Close PlayMenu")
				resume_game()
	if Input.is_action_pressed("inventory"):
		if Variable.InventoryOpen == true:
			InventoryGestion.CloseInventory()
		else:
			InventoryGestion.OpenInventory()
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
