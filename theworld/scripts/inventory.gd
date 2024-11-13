extends Control

@onready var icon: TextureRect = $Description/DescriptionBox/Header/Icon as TextureRect
@onready var description_label: RichTextLabel = $Description/DescriptionBox/DescriptionLabel as RichTextLabel
@onready var name_label: Label = $Description/DescriptionBox/Header/Name_Label as Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if icon == null:
		print("Error: icon is null")
	if description_label == null:
		print("Error: description_label is null")
	if name_label == null:
		print("Error: name_label is null")

@warning_ignore("shadowed_global_identifier")
const Item = preload("res://scripts/item_class.gd")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func set_description(item : Item):
	name_label.text = item.title
	icon.texture = item.icon
	description_label.text = item.description



#func OpenInventory():
	#$".".show()
	#Variable.CaptureMouseOff()
	#Variable.InventoryOpen = true
	#Variable.pause_character()
#
#func CloseInventory():
	#$".".hide()
	#Variable.CaptureMouseOn()
	#Variable.InventoryOpen = false
	#Variable.resume_character()
