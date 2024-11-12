extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const ROTATION_SPEED = 0.005

@onready var head: CollisionShape3D = $Head
@onready var interaction_box: Area3D = $"Interaction box"
@export var catch_key = "interaction"

var caught_object = null
var nearby_catchable_objects = []

func _process(delta):
	if Input.is_action_just_pressed(catch_key):
		if caught_object:
			release_object()
		else:
			try_to_catch_object()

func try_to_catch_object():
	print("Attempting to catch object")
	if nearby_catchable_objects.size() > 0:
		caught_object = nearby_catchable_objects[0]
		if caught_object is RigidBody3D and caught_object.has_method("on_caught"):
			print("Caught object:", caught_object.name)
			caught_object.call("on_caught", self)  # Call the on_caught function on the object
		else:
			print("Caught object is not a RigidBody3D or lacks on_caught method")
	else:
		print("No objects nearby to catch")

func release_object():
	if caught_object:
		print("Attempting to release object:", caught_object.name)
		if caught_object is RigidBody3D and caught_object.has_method("release_object"):
			caught_object.call("release_object")
			caught_object = null
		else:
			print("Caught object is either not a RigidBody3D or lacks release_object method.")

func _on_area_entered(area):
	print("Entered area:", area)
	if area.is_in_group("catchable") and area.get_parent() is RigidBody3D:
		var catchable_object = area.get_parent()
		nearby_catchable_objects.append(catchable_object)
		print("Catchable object entered:", catchable_object.name)

func _on_area_exited(area):
	print("Exited area:", area)
	var catchable_object = area.get_parent()
	if catchable_object in nearby_catchable_objects:
		nearby_catchable_objects.erase(catchable_object)
		print("Catchable object exited:", catchable_object.name)

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
