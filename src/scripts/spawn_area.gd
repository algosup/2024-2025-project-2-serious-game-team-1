extends Node3D

@export var object_scene: PackedScene
@export var spawn_count: int = 10  # Number of objects to spawn
@export var spawn_area_size: Vector3 = Vector3(10, 5, 10)  # Size of the spawn area
@export var min_spawn_interval: float = 1.0  # Minimum cooldown in seconds
@export var max_spawn_interval: float = 10.0  # Maximum cooldown in seconds

func _ready():
	randomize()  # Ensure randomness each time the scene is run
	spawn_objects()

# Function to spawn multiple objects in random positions within the defined area
func spawn_objects() -> void:
	for i in range(spawn_count):
		var obj_instance = object_scene.instantiate()  # Create an instance of the object scene
		EcoFollow.set_eco_beach(-10)
		print(EcoFollow.eco_beach)
		obj_instance.global_transform.origin = get_random_position_in_area()
		add_child(obj_instance)
		print("Spawned object at:", obj_instance.global_transform.origin)
		
		# Generate a random cooldown time between min_spawn_interval and max_spawn_interval
		var cooldown = randf_range(min_spawn_interval, max_spawn_interval)
		
		# Wait for the cooldown before spawning the next object
		await get_tree().create_timer(cooldown).timeout

# Generates a random position within the defined spawn area size
func get_random_position_in_area() -> Vector3:
	var random_x = randf_range(-spawn_area_size.x / 2, spawn_area_size.x / 2)
	var random_y = randf_range(0, spawn_area_size.y)  # Control the vertical spawn height
	var random_z = randf_range(-spawn_area_size.z / 2, spawn_area_size.z / 2)
	return global_transform.origin + Vector3(random_x, random_y, random_z)
