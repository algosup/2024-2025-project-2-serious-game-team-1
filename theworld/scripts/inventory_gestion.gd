extends Control

@onready var icon: TextureRect = $Inventory/Description/DescriptionBox/Header/Icon
@onready var description_label: RichTextLabel = $Inventory/Description/DescriptionBox/DescriptionLabel
@onready var name_label: Label = $Inventory/Description/DescriptionBox/Header/Name_Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var menu = $"."
	menu.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Variable.InventoryOpen:
		$".".show()
		if Variable.MouseCapture:
			Variable.CaptureMouseOff()
	else:
		$".".hide()
		if not Variable.MouseCapture:
			Variable.CaptureMouseOn()

func OpenPlayMenu():
	Variable.PlayMenuOpen = true

func ClosePlayMenu():
	Variable.PlayMenuOpen = false

func OpenInventory():
	print("Open Inventory")
	$".".show()
	Variable.InventoryOpen = !Variable.InventoryOpen
	Variable.CaptureMouseOff()
	if !Variable.PlayerIsPaused:
		Variable.pause_character()

func CloseInventory():
	print("Close Inventory")
	$".".hide()
	Variable.InventoryOpen = !Variable.InventoryOpen
	Variable.CaptureMouseOn()
	if Variable.PlayerIsPaused:
		Variable.resume_character()
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
	
