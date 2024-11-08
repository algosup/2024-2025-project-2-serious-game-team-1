extends Node


var isPaused = true
var PlayerIsPaused = true
var InventoryOpen = false
var PlayMenuOpen = false
var PreviousScene: String = ""
var MouseCapture = false

func CaptureMouseOn():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func CaptureMouseOff():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func pause_character():
	PlayerIsPaused = true
	if MouseCapture:
		CaptureMouseOff()

func resume_character():
	PlayerIsPaused = false
	if not MouseCapture:
		CaptureMouseOn()

func Pause():
	isPaused = true
	get_tree().paused = true

func UnPause():
	isPaused = false
	get_tree().paused = false

func GoBack():
	get_tree().change_scene_to_file(PreviousScene)

func option_game():
	if MouseCapture:
		CaptureMouseOff()
	get_tree().change_scene_to_file("res://option_menu.tscn")
	

func start_game():
	UnPause()
	resume_character()
	Inventory.close_inventory()
	PlayMenu.ClosePlayMenu()
	if not MouseCapture:
		CaptureMouseOn()
	print("Start Game")
	get_tree().change_scene_to_file("res://game_play.tscn")
