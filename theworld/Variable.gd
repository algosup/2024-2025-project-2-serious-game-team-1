extends Node


var isPaused = true
var PlayerIsPaused = true
var InventoryOpen = false
var PlayMenuOpen = false
var PreviousScene: String = ""

func pause_character():
	PlayerIsPaused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func resume_character():
	PlayerIsPaused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func Pause():
	isPaused = true
	get_tree().paused = true

func UnPause():
	isPaused = false
	get_tree().paused = false

func GoBack():
	get_tree().change_scene_to_file(PreviousScene)

func option_game():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene_to_file("res://option_menu.tscn")
	

func start_game():
	UnPause()
	resume_character()
	Inventory.close_inventory()
	PlayMenu.ClosePlayMenu()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	print("Start Game")
	get_tree().change_scene_to_file("res://game_play.tscn")
