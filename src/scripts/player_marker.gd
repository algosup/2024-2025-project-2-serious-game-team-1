extends Sprite3D

# Reference to the CameraManager's _camera_yaw node
@onready var camera_yaw_node = get_parent()

# Rotation speed for the sprite
var rotation_speed: float = 5.0

# Lock Y-axis position to avoid jumping
@export var fixed_y_position: float = 30.0  # This is where you want the marker's Y position to stay

func _process(delta: float) -> void:
	# Check if camera_yaw_node is valid
	if camera_yaw_node:
		# Get the camera's Y-axis rotation (global rotation)
		var target_y_rotation = camera_yaw_node.global_rotation.y
		
		# Smoothly interpolate the Sprite3D's Y-axis rotation towards the camera's Y-axis rotation
		global_rotation.y = lerp_angle(global_rotation.y, target_y_rotation, rotation_speed * delta)
		
		# Lock the Y position to the fixed value
		#global_position.y = fixed_y_position
