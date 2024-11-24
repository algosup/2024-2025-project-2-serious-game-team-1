extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set the minimum size in project settings
	ProjectSettings.set_setting("display/window/size/min_width", Variable.min_size.x)
	ProjectSettings.set_setting("display/window/size/min_height", Variable.min_size.y)
	
	# Enforce the minimum window size using DisplayServer
	DisplayServer.window_set_min_size(Variable.min_size)
	
	
	Variable.current_scene = Variable.MainMenu_path


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Variable.current_size.x < Variable.min_size.x or Variable.current_size.y < Variable.min_size.y:
		DisplayServer.window_set_size(Vector2i(max(Variable.current_size.x, Variable.min_size.x), max(Variable.current_size.y, Variable.min_size.y)))
	Variable.CaptureMouseOff()


func _on_play_button_pressed() -> void:
	Variable.CaptureMouseOn()
	get_tree().change_scene_to_file(Variable.Gameplay_path)

func _on_quit_button_pressed() -> void:
	get_tree().quit() 

func _on_option_button_pressed() -> void:
	Variable.PreviousScene = Variable.current_scene
	get_tree().change_scene_to_file(Variable.OptionMenu_path)
