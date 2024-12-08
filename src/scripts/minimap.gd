extends SubViewport


@onready var player: CharacterBody3D = %Player
@onready var minimap_camera: Camera3D = %Minimap_Camera




func _physics_process(_delta):
	minimap_camera.position = Vector3(player.position.x, player.position.y + 200, player.position.z)
	
	
	
