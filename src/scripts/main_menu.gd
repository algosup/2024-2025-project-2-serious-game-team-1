extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Variable.current_scene = Variable.MainMenu_path
	Variable.Pause()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	Variable.CaptureMouseOff()


func _on_play_button_pressed() -> void:
	Variable.CaptureMouseOn()
	get_tree().change_scene_to_file(Variable.Gameplay_path)

func _on_quit_button_pressed() -> void:
	get_tree().quit() 

func _on_option_button_pressed() -> void:
	Variable.PreviousScene = Variable.current_scene
	get_tree().change_scene_to_file(Variable.OptionMenu_path)
