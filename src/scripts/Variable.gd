extends Node

var InventoryOpen = false
var PlayMenuOpen = false
var QuestMenuOpen = false
var CurrentScene: String = ""
var MouseCapture = false
static var MainMenu_path = "res://assets/ui/main_menu.tscn"
static var OptionMenu_path = "res://assets/ui/option_menu.tscn"
static var Gameplay_path = "res://gameplay.tscn"

var VolumeList : Array = ["master", "music", "sound effect", "dialogue"]
var ChangeVolume : bool = false
var min_size = Vector2i(1152, 648)
var current_size = DisplayServer.window_get_size()
var speed_multiplicator = 1
var cameralock = false
var movelock = false


func show_current():
	if CurrentScene == MainMenu_path:
		print("Showing Option Menu for Main Menu.")
		# Perform any logic needed to update the Option Menu in Main Menu context
		get_tree().call_group("OptionMenuGroup", "update_menu_for_main_menu",)
	elif CurrentScene == Gameplay_path:
		print("Showing Option Menu for Gameplay.")
		# Perform any logic needed to update the Option Menu in Gameplay context
		get_tree().call_group("OptionMenuGroup", "update_menu_for_gameplay")
