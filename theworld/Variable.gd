extends Node

var isPaused = true
var PlayerIsPaused = true
var InventoryOpen = false
var PlayMenuOpen = false
var PreviousScene: String = ""
var MouseCapture = false
var current_scene = ""
var MainMenu_path = "res://main_menu.tscn"
var OptionMenu_path = "res://option_menu.tscn"
var Gameplay_path = "res://game_play.tscn"


func CaptureMouseOn():
	MouseCapture = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func CaptureMouseOff():
	MouseCapture = false
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
	if PreviousScene == Gameplay_path:
		PlayMenuOpen = true
		InventoryOpen = false
		if MouseCapture:
			CaptureMouseOff()
	get_tree().change_scene_to_file(PreviousScene)

func option_game():
	if MouseCapture:
		CaptureMouseOff()
	get_tree().change_scene_to_file(OptionMenu_path)
	

func start_game():
	UnPause()
	resume_character()
	if not MouseCapture:
		CaptureMouseOn()
	print("Start Game")
	get_tree().change_scene_to_file(Gameplay_path)
