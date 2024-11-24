extends Node3D

@onready var InventoryGestion: Control = $PlayInterface/Inventory_Gestion
@onready var PlayMenu: Control = $PlayInterface/PlayMenu

func _ready() -> void:
		# Set the minimum size in project settings
	ProjectSettings.set_setting("display/window/size/min_width", Variable.min_size.x)
	ProjectSettings.set_setting("display/window/size/min_height", Variable.min_size.y)
	
	# Enforce the minimum window size using DisplayServer
	DisplayServer.window_set_min_size(Variable.min_size)


	Variable.UnPause()
	Variable.PlayerIsPaused = !Variable.PlayerIsPaused
	print("Start Game")

func _process(_delta: float) -> void:
	if Variable.current_size.x < Variable.min_size.x or Variable.current_size.y < Variable.min_size.y:
		DisplayServer.window_set_size(Vector2i(max(Variable.current_size.x, Variable.min_size.x), max(Variable.current_size.y, Variable.min_size.y)))

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
