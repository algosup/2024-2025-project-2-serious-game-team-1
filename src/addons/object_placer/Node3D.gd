@tool
extends Node3D
@export var marker:NodePath
@export var sceen:Resource
var dirty=false
# Called when the node enters the scene tree for the first time.
func _ready():
	
	if sceen:
		var new=sceen.instantiate()
		add_child(new)
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if not sceen:
		print('sceen is empty')
		dirty=true
		var new=sceen.instantiate()
		add_child(new)
	if dirty:
		if sceen:
			var new=sceen.instantiate()
			add_child(new)
			dirty=false
	pass
