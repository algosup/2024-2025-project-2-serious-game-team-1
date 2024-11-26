extends Node

var isPaused = true
var InventoryOpen = false
var PlayMenuOpen = false
var PreviousScene: String = ""
var MouseCapture = false
var current_scene = ""
var MainMenu_path = "res://assets/ui/main_menu.tscn"
var OptionMenu_path = "res://assets/ui/option_menu.tscn"
var Gameplay_path = "res://gameplay.tscn"

var VolumeList : Array = ["master", "music", "sound effect", "dialogue"]
var ChangeVolume : bool = false
var min_size = Vector2i(1152, 648)
var current_size = DisplayServer.window_get_size()
var speed_multiplicator = 1


func GoBack():
	if PreviousScene == Gameplay_path:
		PlayMenuOpen = true
		InventoryOpen = false
	get_tree().change_scene_to_file(PreviousScene)

func option_game():
	get_tree().change_scene_to_file(OptionMenu_path)
