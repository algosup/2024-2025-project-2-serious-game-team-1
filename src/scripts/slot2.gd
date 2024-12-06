extends TextureRect

@warning_ignore("shadowed_global_identifier")
const Item = preload("res://scripts/item_ressource.gd")

@export var item : Item_Ressource
@onready var base = $"../../.."
@onready var panel: Panel = $Panel

func _ready():
	if item :  
		texture = item.item_icon

func set_item(value: Item_Ressource):
	item = value
	texture = item.item_icon if item else null
	print(item)

func _on_mouse_entered():
	if item != null:
		base.set_description(item)
