extends Node3D

@onready var InventoryGestion: Control = $PlayInterface/Inventory_Gestion
@onready var PlayMenu: Control = $PlayInterface/PlayMenu

func _ready() -> void:
	Variable.UnPause()
	Variable.PlayerIsPaused = !Variable.PlayerIsPaused
	print("Start Game")


func _input(_event):
	if Input.is_action_pressed("escape"):
		if Variable.InventoryOpen == true:
			InventoryGestion.CloseInventory()
			Variable.CaptureMouseOn()
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
			Variable.CaptureMouseOn()
		else:
			InventoryGestion.OpenInventory()
			Variable.CaptureMouseOff()
	if Input.is_action_just_pressed("interaction"):
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
