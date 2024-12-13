

extends Node3D

@export var object_scene: PackedScene
@export var spawn_count: int = 21  # Number of objects to spawn
@export var spawn_area_size: Vector3 = Vector3(10, 5, 10)  # Size of the spawn area
@export var min_spawn_interval: float = 5.0  # Minimum cooldown in seconds
@export var max_spawn_interval: float = 30.0  # Maximum cooldown in seconds

func _ready():
	randomize()  # Ensure randomness each time the scene is run
	spawn_objects()

func spawn_objects() -> void:
	print("Spawning...")
	for i in range(spawn_count):
		print("Bottle spawned ", i)
		var obj_instance = object_scene.instantiate()
		var current_position = Vector3 (0,0,0)
		if obj_instance:
			obj_instance.transform.origin = random_position(current_position)  # Spawn at the origin
			add_child(obj_instance)
		else:
			print("Failed to instantiate.")
		# Generate a random cooldown time between min_spawn_interval and max_spawn_interval
		var cooldown = randf_range(min_spawn_interval, max_spawn_interval)
		
		# Wait for the cooldown before spawning the next object
		await get_tree().create_timer(cooldown).timeout

func random_position(value):
	var random_x = randf_range(-spawn_area_size.x / 2, spawn_area_size.x / 2)
	var random_y = randf_range(0, spawn_area_size.y)
	var random_z = randf_range(-spawn_area_size.z / 2, spawn_area_size.z / 2)
	
	
	value = Vector3(random_x, random_y, random_z)
	print("value")
	return value
