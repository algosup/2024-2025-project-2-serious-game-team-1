extends Control

@onready var option_menu: Control = $OptionMenu
@onready var v_box_container: VBoxContainer = $VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	option_menu.in_menu = true
	Variable.CurrentScene = Variable.MainMenu_path
	# Set the minimum size in project settings
	ProjectSettings.set_setting("display/window/size/min_width", Variable.min_size.x)
	ProjectSettings.set_setting("display/window/size/min_height", Variable.min_size.y)
	
	# Enforce the minimum window size using DisplayServer
	DisplayServer.window_set_min_size(Variable.min_size)
	v_box_container.show()
	option_menu.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Variable.current_size.x < Variable.min_size.x or Variable.current_size.y < Variable.min_size.y:
		DisplayServer.window_set_size(Vector2i(max(Variable.current_size.x, Variable.min_size.x), max(Variable.current_size.y, Variable.min_size.y)))


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file(Variable.Gameplay_path)

func _on_quit_button_pressed() -> void:
	get_tree().quit() 
	
func _on_option_button_pressed() -> void:
	Variable.CurrentScene = Variable.MainMenu_path
	option_menu.show()
