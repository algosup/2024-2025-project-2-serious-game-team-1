extends TextureRect

@warning_ignore("shadowed_global_identifier")
const Item = preload("res://scripts/item_class.gd")
const ItemPreview = preload("res://scripts/item_preview.gd")

@export var item : Item
@onready var panel: Panel = $Panel
@onready var base = $"../../.."


func _ready():
	texture = item.icon if item else null

func set_item(value):
	item = value
	texture = item.icon if item else null
	print(item)

func _on_mouse_entered():
	if item != null:
		base.set_description(item)  

func _get_drag_data(_at_position):
	
	var preview_texture = TextureRect.new()
	
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(64,64)
	
	var preview = ItemPreview.new()
	preview.preview_texture = preview_texture
	preview.item_placeholder = item
	
	set_drag_preview(preview.preview_texture)
	texture = null
	item = null
	
	return preview

func _can_drop_data(_at_position, data):
	return data is ItemPreview

func _drop_data(_at_position, data):
	texture = data.preview_texture.texture
	item = data.item_placeholder
