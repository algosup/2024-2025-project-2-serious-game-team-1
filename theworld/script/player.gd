extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const ROTATION_SPEED = 0.005
var inventory: Array = []

@onready var head: CollisionShape3D = $Head

func _process(delta: float) -> void:
	if EcoFollow.item_in_hand:
		# Position the item near the player
		var item = EcoFollow.item_in_hand
		item.global_transform.origin = global_transform.origin + Vector3(1, 1, 0)  # Adjust position as desired

func _input(event):
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x * ROTATION_SPEED
		head.rotation.x -= event.relative.y * ROTATION_SPEED
		rotation.x = clamp(rotation.x, deg_to_rad(-10), deg_to_rad(10))

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir := Input.get_vector("moveleft", "moveright", "moveup", "movedown")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
