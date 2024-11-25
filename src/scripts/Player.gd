extends CharacterBody3D

@onready var camera_manager: Node3D = $CameraManager

@export var MOVE_SPEED: float = 5.0
@export var JUMP_SPEED: float = 10
@export var ROTATION_SPEED : float = 0.005
@export var movelock : bool = false

@export var gravity_enabled: bool = true:
	set(p_value):
		gravity_enabled = p_value
		if not gravity_enabled:
			velocity.y = 0

@export var collision_enabled: bool = true:
	set(p_value):
		collision_enabled = p_value
		$CollisionShapeBody.disabled = !collision_enabled
		$CollisionShapeRay.disabled = !collision_enabled

func _physics_process(delta: float) -> void:
	# Handle gravity
	if gravity_enabled and not is_on_floor():
		velocity.y -= 40 * delta
	if !movelock:
		# Get input direction relative to the camera
		var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
		var direction := (camera_manager.global_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

		# Horizontal velocity
		if direction != Vector3.ZERO:
			#Sprint possibility
			if Input.is_action_pressed("sprint") and is_on_floor():
				velocity.x = direction.x * MOVE_SPEED * 1.5
				velocity.z = direction.z * MOVE_SPEED * 1.5
			else:
				velocity.x = direction.x * MOVE_SPEED
				velocity.z = direction.z * MOVE_SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, MOVE_SPEED)
			velocity.z = move_toward(velocity.z, 0, MOVE_SPEED)

		# Jump
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_SPEED

	# Movement
	move_and_slide()

func _input(event: InputEvent) -> void:
	if !movelock:
		if event is InputEventMouseMotion: 
				rotation.y -= event.relative.x * ROTATION_SPEED
				rotation.x -= event.relative.y * ROTATION_SPEED
		if event is InputEventMouseButton and event.pressed:
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				MOVE_SPEED = clamp(MOVE_SPEED + 5, 5, 9999)
			elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				MOVE_SPEED = clamp(MOVE_SPEED - 5, 5, 9999)

	elif event is InputEventKey:
		if event.pressed:
			if event.keycode == KEY_G:
				gravity_enabled = !gravity_enabled
			elif event.keycode == KEY_C:
				collision_enabled = !collision_enabled
