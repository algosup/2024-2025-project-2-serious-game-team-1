# Object.gd
extends RigidBody3D

@onready var hitbox = $HitBox as Area3D
@onready var display_graphic = $Graphic as CSGBox3D
@onready var main_collision = $"%MainCollison" as CollisionShape3D
@onready var canvas_layer = $"2D" as CanvasLayer

var is_caught = false
var player = null  # Reference to the player instance

func _ready():
	canvas_layer.hide()  # Hide the 2D representation initially
	display_graphic.show()  # Show the 3D representation
	main_collision.disabled  # Enable collision
	hitbox.add_to_group("catchable")  # Add hitbox to "catchable" group
	PhysicsServer3D.body_set_mode(self.get_rid(), PhysicsServer3D.BODY_MODE_RIGID)  # Set to rigid body mode
	gravity_scale = 1  # Enable gravity

func _physics_process(delta):
	# Make the object follow the player if it's caught
	if is_caught and player:
		var target_position = player.global_transform.origin + player.global_transform.basis.z * -2  # Position it in front of the player
		global_transform.origin = target_position
		global_transform.basis = player.global_transform.basis  # Align orientation with the player

func on_caught(player_instance):
	# Handle logic when the object is caught by the player
	is_caught = true
	player = player_instance
	main_collision.disabled = true  # Disable collision to prevent physics interference
	display_graphic.hide()  # Hide 3D graphic when caught
	canvas_layer.show()  # Show 2D representation
	PhysicsServer3D.body_set_mode(self.get_rid(), PhysicsServer3D.BODY_MODE_KINEMATIC)  # Set to kinematic mode
	gravity_scale = 0  # Disable gravity

func release_object():
	# Handle logic when the object is released by the player
	is_caught = false
	player = null  # Clear player reference
	main_collision.disabled = false  # Re-enable collision
	display_graphic.show()  # Show 3D graphic when released
	canvas_layer.hide()  # Hide 2D representation
	PhysicsServer3D.body_set_mode(self.get_rid(), PhysicsServer3D.BODY_MODE_RIGID)  # Set to rigid body mode
	gravity_scale = 1  # Enable gravity
