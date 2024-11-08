extends Node


var isPaused = true
var PlayerIsPaused = false
var InventoryOpen = false
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

func lunch_game():
	print("Start Game")
	get_tree().change_scene_to_file("res://menu.tscn")

func GoBack():
	get_tree().change_scene_to_file(PreviousScene)

func option_game():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene_to_file("res://option_menu.tscn")
	

func start_game():
	UnPause()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	print("Start Game")
	get_tree().change_scene_to_file("res://Game.tscn")
