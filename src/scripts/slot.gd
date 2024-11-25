extends PanelContainer

@warning_ignore("shadowed_global_identifier")
const Item = preload("res://scripts/item_ressource.gd")

@export var item : Item_Ressource :
	set(value):
		item = value
		$Icon.texture = item.icon

func set_item(value):
	item = value
	if item:
		$Icon.texture = item.icon

func _on_mouse_entered():
	if item != null:
		var base = $"../../.."
		base.set_description(item)
