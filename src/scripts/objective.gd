extends Area3D

@onready var progress_bar: ProgressBar = $CanvasLayer/ProgressBar
@onready var collision_shape_3d: CollisionShape3D = $CollisionShape3D
@onready var csg_cylinder_3d: CSGCylinder3D = $CollisionShape3D/CSGCylinder3D
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var upper_icon: Sprite3D = $Upper_Icon

@export var time_to_stay : float
@export var quest_name : String
@export var quest : Quests_Resources
var timer: float = 0.0
var is_character_in_area: bool

func hide_zone() -> void:
	canvas_layer.hide()
	csg_cylinder_3d.hide()
	upper_icon.hide()
	collision_shape_3d.disabled = true

func show_zone():
	csg_cylinder_3d.show()
	upper_icon.show()
	collision_shape_3d.disabled = false

func show_progress_bar():
	print("Show progress bar")
	canvas_layer.visible = true

func hide_progress_bar():
	print("hide progress bar")
	canvas_layer.visible = false


func _process(delta: float) -> void:
	if is_character_in_area:
		timer += delta
		progress_bar.value = timer
		progress_bar.max_value = time_to_stay
		if timer >= time_to_stay:
			quest.add_counter()
			queue_free()
			
func area_spawn():
	for i in range(len(AllDictionary.active_main_quests)):
		if AllDictionary.active_main_quests[i] == quest_name:
			hide_zone()
		else :
			show_zone()
	hide_progress_bar()

func _on_body_entered(body: Node) -> void:
	if body is CharacterBody3D:
		is_character_in_area = true
		timer = 0.0 
		show_progress_bar()


func _on_body_exited(body: Node3D) -> void:
	if body is CharacterBody3D:
		is_character_in_area = false
		timer = 0.0
		hide_progress_bar()
