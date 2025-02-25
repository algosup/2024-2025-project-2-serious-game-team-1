extends Control

@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var option_menu: Control = $"../OptionMenu"

@onready var quests_panel: Control = %quests_panel
@onready var player_ui: Control = %Player_UI


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Variable.CurrentScene = Variable.Gameplay_path # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Variable.PlayMenuOpen:
		canvas_layer.show()
	else:
		canvas_layer.hide()
		
func OpenPlayMenu():
	Variable.PlayMenuOpen = true
func ClosePlayMenu():
	Variable.PlayMenuOpen = false
func _on_resume_button_pressed() -> void:
	resume_game()
func _on_option_menu_pressed() -> void:
	Variable.CurrentScene = Variable.Gameplay_path
	player_ui.Player_uiInvisible()
	quests_panel.HideQuestsPanels()
	ClosePlayMenu()
	option_menu.is_option_open = true
	option_menu.show()
func _on_back_button_pressed() -> void:
	get_tree().quit()
	
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
