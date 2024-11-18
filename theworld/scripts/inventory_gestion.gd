extends Control

@onready var icon: TextureRect = $Inventory/Description/DescriptionBox/Header/Icon
@onready var description_label: RichTextLabel = $Inventory/Description/DescriptionBox/DescriptionLabel
@onready var name_label: Label = $Inventory/Description/DescriptionBox/Header/Name_Label

@warning_ignore("shadowed_global_identifier")
const Item = preload("res://scripts/item_class.gd")

var inventory : Array[Item] = [
	preload("res://assets/items/bin_bag.tres"),
	preload("res://assets/items/extinguisher.tres"),
	preload("res://assets/items/planks.tres"),
	preload("res://assets/items/shovel.tres"),
	preload("res://assets/items/tree_shoots.tres"), 
	null, null, null, null, null,
	null, null, null, null, null,
	null, null, null, null, null
]

@onready var inventory_slot_1: PanelContainer = $Inventory/GridInventory/inventory_slot1
@onready var inventory_slot_2: PanelContainer = $Inventory/GridInventory/inventory_slot2
@onready var inventory_slot_3: PanelContainer = $Inventory/GridInventory/inventory_slot3
@onready var inventory_slot_4: PanelContainer = $Inventory/GridInventory/inventory_slot4
@onready var inventory_slot_5: PanelContainer = $Inventory/GridInventory/inventory_slot5
@onready var inventory_slot_6: PanelContainer = $Inventory/GridInventory/inventory_slot6
@onready var inventory_slot_7: PanelContainer = $Inventory/GridInventory/inventory_slot7
@onready var inventory_slot_8: PanelContainer = $Inventory/GridInventory/inventory_slot8
@onready var inventory_slot_9: PanelContainer = $Inventory/GridInventory/inventory_slot9
@onready var inventory_slot_10: PanelContainer = $Inventory/GridInventory/inventory_slot10
@onready var inventory_slot_11: PanelContainer = $Inventory/GridInventory/inventory_slot11
@onready var inventory_slot_12: PanelContainer = $Inventory/GridInventory/inventory_slot12
@onready var inventory_slot_13: PanelContainer = $Inventory/GridInventory/inventory_slot13
@onready var inventory_slot_14: PanelContainer = $Inventory/GridInventory/inventory_slot14
@onready var inventory_slot_15: PanelContainer = $Inventory/GridInventory/inventory_slot15
@onready var inventory_slot_16: PanelContainer = $Inventory/GridInventory/inventory_slot16
@onready var inventory_slot_17: PanelContainer = $Inventory/GridInventory/inventory_slot17
@onready var inventory_slot_18: PanelContainer = $Inventory/GridInventory/inventory_slot18
@onready var inventory_slot_19: PanelContainer = $Inventory/GridInventory/inventory_slot19
@onready var inventory_slot_20: PanelContainer = $Inventory/GridInventory/inventory_slot20

@onready var slots : Array[PanelContainer] = [
	inventory_slot_1, inventory_slot_2, inventory_slot_3, inventory_slot_4, inventory_slot_5, 
	inventory_slot_6, inventory_slot_7, inventory_slot_8, inventory_slot_9, inventory_slot_10,
	inventory_slot_11, inventory_slot_12, inventory_slot_13, inventory_slot_14, inventory_slot_15,
	inventory_slot_16, inventory_slot_17, inventory_slot_18, inventory_slot_19, inventory_slot_20
	]

# Called when the node enters the scene tree for the first time.
func _enter_tree() -> void:
	for i in range(slots.size()):
		if inventory[i] != null:
			slots[i].set_item(inventory[i])

var item_in_hand: Item = null #Credit Matteo

func add_to_inventory(item : Item):
	#Credit Matteo & Alexis
	if item not in inventory:
		if null not in inventory:
			print("Inventory is full")
		for i in inventory:
			if i == null :
				inventory[i] = item
				print("Added %s to inventory" % item.title)
				item.pick_up()
				break
	else:
		print("%s is already in inventory" % item.title)

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
