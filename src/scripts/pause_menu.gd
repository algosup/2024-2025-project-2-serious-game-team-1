extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Variable.current_scene = Variable.Gameplay_path # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Variable.PlayMenuOpen:
		$".".show()
		if Variable.MouseCapture:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		$".".hide()
		if not Variable.MouseCapture:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
func OpenPlayMenu():
	Variable.PlayMenuOpen = true
func ClosePlayMenu():
	Variable.PlayMenuOpen = false
func _on_resume_button_pressed() -> void:
	resume_game()
func _on_option_menu_pressed() -> void:
	Variable.PreviousScene = Variable.current_scene
	get_tree().change_scene_to_file(Variable.OptionMenu_path)
func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file(Variable.MainMenu_path)
	
func resume_game():
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	print("Resume Game")
	ClosePlayMenu()
func pause_game():
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	print("Pause Game")
	OpenPlayMenu()
