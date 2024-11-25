extends Node

#Menus
@onready var menus: Node = $Menus
#Menus & UI Loading nodes
@onready var inventory_gestion: Control = $Menus/Inventory_Gestion

#Game Play
@onready var gameplay: Node = $Gameplay
#Game Play Loading nodes
@onready var map: Node3D = $Map
@onready var player: CharacterBody3D = %Player
@onready var roger: Pnj = $Roger
@onready var spawn_area: Node3D = $"spawn area"
@onready var bin_bag: Item_Object = $"bin bag"

func _ready() -> void:
	inventory_gestion.hide()
	# Set the minimum size in project settings
	ProjectSettings.set_setting("display/window/size/min_width", Variable.min_size.x)
	ProjectSettings.set_setting("display/window/size/min_height", Variable.min_size.y)
	# Enforce the minimum window size using DisplayServer
	DisplayServer.window_set_min_size(Variable.min_size)
	Variable.current_scene = Variable.MainMenu_path

func _process(_delta):
	if Variable.current_size.x < Variable.min_size.x or Variable.current_size.y < Variable.min_size.y:
		DisplayServer.window_set_size(Vector2i(max(Variable.current_size.x, Variable.min_size.x), max(Variable.current_size.y, Variable.min_size.y)))
