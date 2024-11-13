extends PanelContainer

const Item = preload("res://scripts/item_class.gd")

@export var item : Item 

func set_item(value):
	item = value
	if item:
		$Icon.texture = item.icon


func _on_mouse_entered():
	if item != null:
		owner.set_description(item)
