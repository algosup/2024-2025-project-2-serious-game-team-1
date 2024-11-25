extends Node

var isPaused = true
var PlayerIsPaused = true
var InventoryOpen = false
var PlayMenuOpen = false
var PreviousScene: String = ""
var MouseCapture = false
var current_scene = ""
var MainMenu_path = "res://scenes/main_menu.tscn"
var OptionMenu_path = "res://scenes/option_menu.tscn"
var Gameplay_path = "res://assets/map/map.tscn"

var VolumeList : Array = ["master", "music", "sound effect", "dialogue"]
var ChangeVolume : bool = false
var min_size = Vector2i(1152, 648)
var current_size = DisplayServer.window_get_size()


func CaptureMouseOn():
	MouseCapture = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func CaptureMouseOff():
	MouseCapture = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func pause_character():
	PlayerIsPaused = true


func resume_character():
	PlayerIsPaused = false

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
	get_tree().change_scene_to_file(PreviousScene)

func option_game():
	get_tree().change_scene_to_file(OptionMenu_path)
