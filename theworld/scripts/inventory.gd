extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

@onready var name_label: Label = $Inventory/Description/DescriptionBox/Header/Name_Label as Label
@onready var icon: TextureRect = $Inventory/Description/DescriptionBox/Header/Icon as TextureRect
@onready var description_label: RichTextLabel = $Inventory/Description/DescriptionBox/DescriptionLabel as RichTextLabel

func _input(_event):
	if Input.is_action_just_pressed("inventory"):
		if Variable.InventoryOpen == true:
			CloseInventory()
		else:
			OpenInventory()

@warning_ignore("shadowed_global_identifier")
const Item = preload("res://scripts/item_class.gd")

func OpenInventory():
	Variable.InventoryOpen = true
	$".".show()
	Variable.CaptureMouseOff()
	Variable.pause_character()
	print("Open Inventory")

func CloseInventory():
	Variable.InventoryOpen = false
	$".".hide()
	Variable.CaptureMouseOn()
	Variable.resume_character()
	print("Close Inventory")

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
