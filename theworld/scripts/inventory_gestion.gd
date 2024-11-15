extends Control

@onready var icon: TextureRect = get_node("Inventory/Description/DescriptionBox/Header/Icon")
@onready var description_label: RichTextLabel = get_node("Inventory/Description/DescriptionBox/DescriptionLabel")
@onready var name_label: Label = get_node("Inventory/Description/DescriptionBox/Header/Name_Label")

@warning_ignore("shadowed_global_identifier")
const Item = preload("res://scripts/item_class.gd")

var inventory : Array = [
	preload("res://assets/items/bin_bag.tres"), 
	preload("res://assets/items/extinguisher.tres"), 
	preload("res://assets/items/planks.tres"), 
	preload("res://assets/items/shovel.tres"), 
	preload("res://assets/items/tree_shoots.tres")
	]



var slots : Array[PanelContainer] = [
	$Inventory/GridInventory/slot0, 
	get_node("Inventory/GridInventory/slot1"),
	get_node("Inventory/GridInventory/slot2"), 
	get_node("Inventory/GridInventory/slot3"), 
	get_node("Inventory/GridInventory/slot4"), 
	get_node("Inventory/GridInventory/slot5"), 
	get_node("Inventory/GridInventory/slot6"), 
	get_node("Inventory/GridInventory/slot7"), 
	get_node("Inventory/GridInventory/slot8"), 
	get_node("Inventory/GridInventory/slot9"), 
	get_node("Inventory/GridInventory/slot10"), 
	get_node("Inventory/GridInventory/slot11"), 
	get_node("Inventory/GridInventory/slot12"), 
	get_node("Inventory/GridInventory/slot13"), 
	get_node("Inventory/GridInventory/slot14"), 
	get_node("Inventory/GridInventory/slot15"), 
	get_node("Inventory/GridInventory/slot16"), 
	get_node("Inventory/GridInventory/slot17"), 
	get_node("Inventory/GridInventory/slot18"), 
	get_node("Inventory/GridInventory/slot19")
	]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#for i in range(inventory.size()):
			#if i < slots.size() and i <= inventory.size()-1:
				#slots[i].set_item(inventory[i])
	for node in slots:
		print(node)

var item_in_hand: Item = null #Credit Matteo 
		

func add_to_inventory(item : Item):
	#Credit Matteo & Alexis
	if item not in inventory:
		if inventory.size() == slots.size():
			print("Inventory is full")
		else:
			inventory.append(item)
			print("Added %d to inventory" % item.title)
			item.pick_up()
	else:
		print("%d is already in inventory" % item.title)


func _process(_delta: float) -> void:
	if Variable.InventoryOpen:
		get_node(".").show()
		if Variable.MouseCapture:
			Variable.CaptureMouseOff()
		if !Variable.PlayerIsPaused:
			Variable.pause_character()
		
	else:
		get_node(".").hide()
		if not Variable.MouseCapture:
			Variable.CaptureMouseOn()
		if Variable.PlayerIsPaused:
			Variable.resume_character()

func OpenInventory():
	print("Open Inventory")
	Variable.InventoryOpen = !Variable.InventoryOpen


func CloseInventory():
	print("Close Inventory")
	Variable.InventoryOpen = !Variable.InventoryOpen


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
	
