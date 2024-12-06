extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var anim_tree: AnimationTree = $AnimationTree


func talking():
	print("start animation...")
	print(anim_tree.get("parameters/conditions/can_talk"))
	if anim_tree.get("parameters/conditions/can_talk"):
		anim_tree.set("parameters/StateMachine/current", "Talk")
