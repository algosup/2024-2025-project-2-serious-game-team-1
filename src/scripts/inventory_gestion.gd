extends Control

@onready var icon: TextureRect = $Inventory/Description/DescriptionBox/Header/Icon
@onready var description_label: RichTextLabel = $Inventory/Description/DescriptionBox/DescriptionLabel
@onready var name_label: Label = $Inventory/Description/DescriptionBox/Header/Name_Label

@warning_ignore("shadowed_global_identifier")
const Item = preload("res://scripts/item_class.gd")

var inventorySize : int = 20

var inventory : Array[Item] = [
	preload("res://assets/items/axe.tres"),
	preload("res://assets/items/bin_bag.tres"),
	preload("res://assets/items/extinguisher.tres"),
	preload("res://assets/items/planks.tres"),
	preload("res://assets/items/shovel.tres"),
	preload("res://assets/items/tree_shoots.tres"),
	null, null, null, null,
	null, null, null, null, null,
	null, null, null, null, null
]

@onready var slot_1: TextureRect = $Inventory/GridInventory/Slot1
@onready var slot_2: TextureRect = $Inventory/GridInventory/Slot2
@onready var slot_3: TextureRect = $Inventory/GridInventory/Slot3
@onready var slot_4: TextureRect = $Inventory/GridInventory/Slot4
@onready var slot_5: TextureRect = $Inventory/GridInventory/Slot5
@onready var slot_6: TextureRect = $Inventory/GridInventory/Slot6
@onready var slot_7: TextureRect = $Inventory/GridInventory/Slot7
@onready var slot_8: TextureRect = $Inventory/GridInventory/Slot8
@onready var slot_9: TextureRect = $Inventory/GridInventory/Slot9
@onready var slot_10: TextureRect = $Inventory/GridInventory/Slot10
@onready var slot_11: TextureRect = $Inventory/GridInventory/Slot11
@onready var slot_12: TextureRect = $Inventory/GridInventory/Slot12
@onready var slot_13: TextureRect = $Inventory/GridInventory/Slot13
@onready var slot_14: TextureRect = $Inventory/GridInventory/Slot14
@onready var slot_15: TextureRect = $Inventory/GridInventory/Slot15
@onready var slot_16: TextureRect = $Inventory/GridInventory/Slot16
@onready var slot_17: TextureRect = $Inventory/GridInventory/Slot17
@onready var slot_18: TextureRect = $Inventory/GridInventory/Slot18
@onready var slot_19: TextureRect = $Inventory/GridInventory/Slot19
@onready var slot_20: TextureRect = $Inventory/GridInventory/Slot20

@onready var slots : Array = [
	slot_1, slot_2, slot_3, slot_4, slot_5,
	slot_6, slot_7, slot_8, slot_9, slot_10,
	slot_11, slot_12, slot_13, slot_14, slot_15,
	slot_16, slot_17, slot_18, slot_19, slot_20,
]

func _ready() -> void:
	for i in range(len(slots)):
		var item = inventory[i]
		if item is Item:
			slots[i].set_item(item)
		else:
			print("Invalid item type at index ", i)

func OpenInventory():
	print("Open Inventory")
	Variable.InventoryOpen = !Variable.InventoryOpen
	Variable.CaptureMouseOff()
	$".".show()
	Variable.pause_character()

func CloseInventory():
	print("Close Inventory")
	Variable.InventoryOpen = !Variable.InventoryOpen
	Variable.CaptureMouseOn()
	$".".hide()
	Variable.resume_character()

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
