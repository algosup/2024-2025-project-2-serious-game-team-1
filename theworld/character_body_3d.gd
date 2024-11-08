extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const ROTATION_SPEED = 0.005

func _input(event):
	if not Variable.PlayerIsPaused:
		if event is InputEventMouseMotion: 
			rotation.y -= event.relative.x * ROTATION_SPEED
			rotation.x -= event.relative.y * ROTATION_SPEED

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if not Variable.PlayerIsPaused:
		var input_dir := Input.get_vector("move_left","move_right","move_up","move_down")
		var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
			
		if direction:
			if Input.is_action_pressed("sprint") and is_on_floor():
				velocity.x = direction.x * SPEED * 1.5
				velocity.z = direction.z * SPEED * 1.5
			else:
				velocity.x = direction.x * SPEED
				velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
				
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		
		
		move_and_slide()
