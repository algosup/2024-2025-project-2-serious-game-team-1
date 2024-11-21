extends StaticBody3D

@export_category("Current_Zone")
@export var zone_name: String

func _on_area_3d_body_entered(body: Node3D) -> void:
	zone_name = $".".name
	print(body.name + " entered in " + zone_name)	
	
func _on_area_3d_body_exited(body: Node3D) -> void:
	print(body.name + " leaved " + zone_name)
	zone_name = ""
	
