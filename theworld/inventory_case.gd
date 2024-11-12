extends TextureRect


func _get_drag_data(_at_position):
	return texture


func _can_drop_data(_at_position, data):
	return data is Texture2D


func _drop_data(_at_position, data):
	texture = data
