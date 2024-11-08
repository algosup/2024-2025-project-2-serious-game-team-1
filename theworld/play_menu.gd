extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Variable.PlayMenuOpen:
		$".".show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		$".".hide()
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func OpenPlayMenu():
	Variable.PlayMenuOpen = true

func ClosePlayMenu():
	Variable.PlayMenuOpen = false

func _on_resume_button_pressed() -> void:
	Variable.UnPause()
	Variable.resume_character()

func _on_option_menu_pressed() -> void:
	Variable.PreviousScene = "res://game_play.tscn"
	get_tree().change_scene_to_file("res://option_menu.tscn")

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
