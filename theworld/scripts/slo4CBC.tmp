extends TextureRect



func _get_drag_data(_at_position):
	var preview_texture = TextureRect.new()
	
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(128, 128)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	
	texture = null
	
	return preview_texture.texture


func _can_drop_data(_at_position, data):
	return data is Texture2D


func _drop_data(_at_position, data):
	texture = data

@export var item : Item :
	set(value):
		item = value
		$Icon.texture = item.icon


func _on_mouse_entered():
	if item != null:
		owner.set_description(item)
