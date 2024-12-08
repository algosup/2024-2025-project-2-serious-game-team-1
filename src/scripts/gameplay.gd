extends Node

#Menus
@onready var menus: Node = $Menus
#Menus & UI Loading nodes


#Game Play
@onready var gameplay: Node = $Gameplay
#Game Play Loading nodes
@onready var map: Node3D = $Gameplay/Map
@onready var roger: Pnj = $Gameplay/Pnj/Roger
@onready var mr_mayor: Pnj = $Gameplay/Pnj/Mr_Mayor
@onready var elie: Pnj = $Gameplay/Pnj/Elie
@onready var bin_bag: Item_Object = $"Gameplay/Object/bin bag"
@onready var player: CharacterBody3D = %Player
@onready var player_ui: Control = %Player_UI

@onready var option_menu: Control = $Menus/OptionMenu
@onready var pause_menu: Control = %pause_menu
@onready var inventory_gestion: Control = %Inventory_Gestion
@onready var quest_menu: Control = %quest_menu
@onready var quests_panel: Control = %quests_panel


func _ready() -> void:
	mr_mayor.position = Vector3(412.907, 45.016, 616.121)
	mr_mayor.rotation = Vector3(0, -26.2, 0)
	#mr_mayor.position = Vector3(433.406, 47.287, 595.307)
	#mr_mayor.rotation = Vector3(0, -15.2, 0)
	mr_mayor.dialogue_box.start_id = "Mr_Mayor1"
	mr_mayor.quest_name = "tutorial"
	Variable.movelock = true
	Variable.cameralock = true
	option_menu.in_menu = false
	pause_menu.ClosePlayMenu()
	get_tree().paused = false
	inventory_gestion.hide()
	quest_menu.hide()
	option_menu.hide()
	# Set the minimum size in project settings
	ProjectSettings.set_setting("display/window/size/min_width", Variable.min_size.x)
	ProjectSettings.set_setting("display/window/size/min_height", Variable.min_size.y)
	# Enforce the minimum window size using DisplayServer
	DisplayServer.window_set_min_size(Variable.min_size)



func _process(_delta):
	if Variable.current_size.x < Variable.min_size.x or Variable.current_size.y < Variable.min_size.y:
		DisplayServer.window_set_size(Vector2i(max(Variable.current_size.x, Variable.min_size.x), max(Variable.current_size.y, Variable.min_size.y)))
	if Input.is_action_just_pressed("inventory"):
		if Variable.InventoryOpen:
			inventory_gestion.CloseInventory()
		else:
			inventory_gestion.OpenInventory()
	if Input.is_action_just_pressed("quest_menu"):
		if Variable.QuestMenuOpen:
			quest_menu.CloseQuestMenu()
		else:
			quest_menu.OpenQuestMenu()
	if Input.is_action_just_pressed("escape"):
		if Variable.InventoryOpen:
			inventory_gestion.CloseInventory()
		elif Variable.QuestMenuOpen:
			quest_menu.CloseQuestMenu()
		elif Variable.PlayMenuOpen:
			pause_menu.resume_game()
		else:
			pause_menu.pause_game()


func _on_introduction_animation_animation_end() -> void:
	Variable.movelock = false
	Variable.cameralock = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
