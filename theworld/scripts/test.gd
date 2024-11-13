extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@onready var icon: TextureRect = $Inventory/Description/DescriptionBox/Header/Icon as TextureRect
@onready var description_label: RichTextLabel = $Inventory/Description/DescriptionBox/DescriptionLabel as RichTextLabel
@onready var name_label: Label = $Inventory/Description/DescriptionBox/Header/Name_Label as Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

@warning_ignore("shadowed_global_identifier")
const Item = preload("res://scripts/item_class.gd")

func set_description(item : Item):
	if name_label != null:
		name_label.text = item.title
	else:
		print("null name_label")
	if icon != null:
		icon.texture = item.icon
	else:
		print("null icon")
	if description_label != null:
		description_label.text = item.description
	else:
		print("null description_label")
