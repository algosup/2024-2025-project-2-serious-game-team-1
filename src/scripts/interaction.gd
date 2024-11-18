extends RayCast3D

@onready var prompt = $Prompt

func _physics_process(delta):
	prompt.text = ""
	
	if is_colliding():
		var collider = get_collider()
		prompt.text = "detecting " + collider.name
