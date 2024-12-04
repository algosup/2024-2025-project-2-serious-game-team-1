extends Node

#Menus
@onready var menus: Node = $Menus
#Menus & UI Loading nodes


#Game Play
@onready var gameplay: Node = $Gameplay
#Game Play Loading nodes
@onready var map: Node3D = $Gameplay/Map
@onready var roger: Pnj = $Gameplay/Roger
@onready var spawn_area: Node3D = $"Gameplay/spawn area"
@onready var bin_bag: Item_Object = $"Gameplay/bin bag"
@onready var player: CharacterBody3D = %Player
@onready var player_ui: Control = $"Gameplay/Player/Player UI"

@onready var option_menu: Control = $Menus/OptionMenu
@onready var pause_menu: Control = %pause_menu
@onready var inventory_gestion: Control = %Inventory_Gestion
@onready var quest_menu: Control = %quest_menu
@onready var quests_panel: Control = %quests_panel


func _ready() -> void:
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
