extends Node3D

const CAMERA_MAX_PITCH: float = deg_to_rad(70)
const CAMERA_MIN_PITCH: float = deg_to_rad(-89.9)
const CAMERA_RATIO: float = .625

@export var mouse_sensitivity: float = .002
@export var mouse_y_inversion: float = -1.0

@onready var _camera_yaw: Node3D = self
@onready var _camera_pitch: Node3D = %Arm


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(p_event: InputEvent) -> void:
	# Check if inventory is open before processing camera input
	if not Variable.InventoryOpen: 
		if p_event is InputEventMouseMotion and Input.MOUSE_MODE_CAPTURED and not Variable.InventoryOpen:
			rotate_camera(p_event.relative)
			get_viewport().set_input_as_handled()



func rotate_camera(p_relative:Vector2) -> void:
	if not Variable.cameralock :
		_camera_yaw.rotation.y -= p_relative.x * (mouse_sensitivity * Variable.speed_multiplicator)
		_camera_yaw.orthonormalize()
		_camera_pitch.rotation.x += p_relative.y * (mouse_sensitivity * Variable.speed_multiplicator) * CAMERA_RATIO * mouse_y_inversion 
		_camera_pitch.rotation.x = clamp(_camera_pitch.rotation.x, CAMERA_MIN_PITCH, CAMERA_MAX_PITCH)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
