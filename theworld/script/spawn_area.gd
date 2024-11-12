extends Node3D

# Path to the scene you want to spawn
@export var object_scene: PackedScene
@export var spawn_count: int = 10  # Number of objects to spawn
@export var spawn_area_size: Vector3 = Vector3(10, 5, 10)  # Size of the spawn area

# Called when the node enters the scene tree
func _ready():
	randomize()  # Ensure randomness each time the scene is run
	spawn_objects()

# Function to spawn multiple objects in random positions within the defined area
func spawn_objects():
	for i in range(spawn_count):
		var obj_instance = object_scene.instantiate()  # Create an instance of the object scene
		obj_instance.global_transform.origin = get_random_position_in_area()
		add_child(obj_instance)
		print("Spawned object at:", obj_instance.global_transform.origin)

# Generates a random position within the defined spawn area size
func get_random_position_in_area() -> Vector3:
	var random_x = randf_range(-spawn_area_size.x / 2, spawn_area_size.x / 2)
	var random_y = randf_range(0, spawn_area_size.y)  # Control the vertical spawn height
	var random_z = randf_range(-spawn_area_size.z / 2, spawn_area_size.z / 2)
	return global_transform.origin + Vector3(random_x, random_y, random_z)
