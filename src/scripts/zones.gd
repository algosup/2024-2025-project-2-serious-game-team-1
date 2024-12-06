extends StaticBody3D

@export_category("Current_Zone")
@export var zone_name: String

@export var audio_stream: AudioStreamPlayer


func _on_area_3d_body_entered(body):
	zone_name = $".".name
	print(body.name + " entered in " + zone_name)	
	if body.name == "Player":
		var node_path = "../" + str(zone_name) + "/AmbiantSound"
		audio_stream = get_node(node_path)
		audio_stream.play()
		if zone_name == null || zone_name == "":
			$"../Wild/AmbiantSound".play()
func _on_area_3d_body_exited(body):
	print(body.name + " leaved " + zone_name)
	zone_name = ""
	if body.name == "Player":
		audio_stream.stream_paused = true
	
