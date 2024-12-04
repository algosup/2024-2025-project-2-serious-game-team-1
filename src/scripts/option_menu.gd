extends Control

@onready var quests_panel: Control = %quests_panel
@onready var player_ui: Control = $"../../Gameplay/Player/Player UI"

# Dynamic references, initialized based on the current scene
var v_box_container: VBoxContainer
var pause_menu: Control

# Flag to track context
var is_option_open: bool = false
var in_menu: bool = false

func _ready():
	# Check if Main Menu context exists
	if has_node("../VBoxContainer"):
		v_box_container = get_node("../VBoxContainer")
		in_menu = true
	# Check if Gameplay context exists
	elif has_node("%pause_menu"):
		pause_menu = get_node("%pause_menu")
		in_menu = false
	else:
		# Handle fallback case if neither context is found
		print("OptionMenu: Could not determine context. Ensure the scene hierarchy is correct.")

	# Set the minimum size in project settings
	ProjectSettings.set_setting("display/window/size/min_width", Variable.min_size.x)
	ProjectSettings.set_setting("display/window/size/min_height", Variable.min_size.y)
	
	# Enforce the minimum window size using DisplayServer
	DisplayServer.window_set_min_size(Variable.min_size)


func _process(_delta: float) -> void:
	if Variable.current_size.x < Variable.min_size.x or Variable.current_size.y < Variable.min_size.y:
		DisplayServer.window_set_size(Vector2i(max(Variable.current_size.x, Variable.min_size.x), max(Variable.current_size.y, Variable.min_size.y)))

	if Variable.MouseCapture:
		Variable.CaptureMouseOff()

	if Input.is_action_just_pressed("escape") and is_option_open:
		is_option_open = false
		GoBack()

func _on_back_button_pressed() -> void:
	GoBack()

func _on_test_button_toggled(button_pressed):
	if button_pressed:
		print("Button is Pressed")
		$TestButton.text = "Pressed"
	else:
		print("Button is Released")
		$TestButton.text = "Released"

func _on_test_button_pressed() -> void:
	$TestButton.text = "Dommage"

func _on_confirm_button_pressed() -> void:
	$MarginContainer/VBoxContainer/TabContainer/Sound/VolumeManager1.set_slider()
	$MarginContainer/VBoxContainer/TabContainer/Sound/VolumeManager2.set_slider()
	$MarginContainer/VBoxContainer/TabContainer/Sound/VolumeManager3.set_slider()
	$MarginContainer/VBoxContainer/TabContainer/Sound/VolumeManager4.set_slider()

func GoBack():
	hide()
	Variable.show_current()
	if not in_menu:
		pause_menu.pause_game()
		player_ui.Player_uiVisible()
		quests_panel.ShowQuestsPanels()
