extends Node

#Menus
@onready var menus: Node = $Menus

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

#Menus & UI Loading nodes
@onready var option_menu: Control = $Menus/OptionMenu
@onready var pause_menu: Control = %pause_menu
@onready var inventory_gestion: Control = %Inventory_Gestion
@onready var quest_menu: Control = %quest_menu
@onready var quests_panel: Control = %quests_panel
@onready var documentary_menu: Control = %Documentary_menu

@onready var introduction_animation: CanvasLayer = $Introduction_Animation
@onready var tutorial_objective_area_1: Area3D = $Gameplay/Quest_Assets/Objective_Areas/tutorial_objective_area1
@onready var tutorial_objective_area_2: Area3D = $Gameplay/Quest_Assets/Objective_Areas/tutorial_objective_area2
@onready var tutorial_objective_area_3: Area3D = $Gameplay/Quest_Assets/Objective_Areas/tutorial_objective_area3
@onready var elie_objective: Area3D = $Gameplay/Quest_Assets/Objective_Areas/elie_objective
@onready var elie_objective_2: Area3D = $Gameplay/Quest_Assets/Objective_Areas/elie_objective2
@onready var elie_objective_3: Area3D = $Gameplay/Quest_Assets/Objective_Areas/elie_objective3

func _ready() -> void:
	#introduction_animation.play_intro()
	mr_mayor.position = Vector3(412.907, 45.016, 616.121)
	mr_mayor.rotation = Vector3(0, -26.2, 0)
	#mr_mayor.position = Vector3(433.406, 47.287, 595.307)
	#mr_mayor.rotation = Vector3(0, -15.2, 0)
	mr_mayor.dialogue_box.start_id = "Mr_Mayor1"
	mr_mayor.quest_name = "Get data"
	Variable.movelock = true
	Variable.cameralock = true
	option_menu.in_menu = false
	pause_menu.ClosePlayMenu()
	get_tree().paused = false
	inventory_gestion.hide()
	quest_menu.hide()
	option_menu.hide()
	documentary_menu.hide()
	# Set the  minimum size in project settings
	ProjectSettings.set_setting("display/window/size/min_width", Variable.min_size.x)
	ProjectSettings.set_setting("display/window/size/min_height", Variable.min_size.y)
	# Enforce the minimum window size using DisplayServer
	DisplayServer.window_set_min_size(Variable.min_size)
	tutorial_objective_area_1.hide_zone()
	tutorial_objective_area_2.hide_zone()
	tutorial_objective_area_3.hide_zone()
	elie_objective.hide()
	elie_objective_2.hide()
	elie_objective_3.hide()


func _process(_delta):
	if Variable.current_size.x < Variable.min_size.x or Variable.current_size.y < Variable.min_size.y:
		DisplayServer.window_set_size(Vector2i(max(Variable.current_size.x, Variable.min_size.x), max(Variable.current_size.y, Variable.min_size.y)))
	if !AllDictionary.NPC_talking:
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
		if Input.is_action_just_pressed("documentary"):
			if Variable.DocumentaryMenuOpen:
				documentary_menu.CloseDoc()
			else:
				documentary_menu.OpenDoc()
		if Input.is_action_just_pressed("escape"):
			if Variable.InventoryOpen:
				inventory_gestion.CloseInventory()
			elif Variable.QuestMenuOpen:
				quest_menu.CloseQuestMenu()
			elif Variable.PlayMenuOpen:
				pause_menu.resume_game()
			elif Variable.DocumentaryMenuOpen:
				documentary_menu.CloseDoc()
			else:
				pause_menu.pause_game()


func _on_introduction_animation_cinematic_done() -> void:
	$Introduction_Animation.queue_free()
	Variable.movelock = false
	Variable.cameralock = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
