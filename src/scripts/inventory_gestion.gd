extends Control

@onready var icon: TextureRect = $Inventory/Description/DescriptionBox/Header/Icon
@onready var description_label: RichTextLabel = $Inventory/Description/DescriptionBox/DescriptionLabel
@onready var name_label: Label = $Inventory/Description/DescriptionBox/Header/Name_Label


@warning_ignore("shadowed_global_identifier")
var Item : Item_Ressource

var inventorySize : int = 20

@onready var slot_01: TextureRect = $Inventory/GridInventory/Slot1
@onready var slot_02: TextureRect = $Inventory/GridInventory/Slot2
@onready var slot_03: TextureRect = $Inventory/GridInventory/Slot3
@onready var slot_04: TextureRect = $Inventory/GridInventory/Slot4
@onready var slot_05: TextureRect = $Inventory/GridInventory/Slot5
@onready var slot_06: TextureRect = $Inventory/GridInventory/Slot6
@onready var slot_07: TextureRect = $Inventory/GridInventory/Slot7
@onready var slot_08: TextureRect = $Inventory/GridInventory/Slot8
@onready var slot_09: TextureRect = $Inventory/GridInventory/Slot9
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
	slot_01, slot_02, slot_03, slot_04, slot_05,
	slot_06, slot_07, slot_08, slot_09, slot_10,
	slot_11, slot_12, slot_13, slot_14, slot_15,
	slot_16, slot_17, slot_18, slot_19, slot_20,
]



			
func add_item(item: Item_Ressource):
	var item_id_as_string = str(item.item_ID)
	
	if AllDictionary.Item_List.has(item_id_as_string):  # Check if the item exists
		for i in range(inventorySize):
			if slots[i] == null:  # Ensure the slot is empty
				slots[i] = AllDictionary.Item_List[item_id_as_string]  # Add item to the slot
				print(item.item_title, "added to slot", i)
				return
		print("Inventory full!")
	else:
		print("Error: Item not found in Item_List:", item_id_as_string)


func OpenInventory():
	print("Open Inventory")
	Variable.InventoryOpen = !Variable.InventoryOpen
	$".".show()
	Variable.movelock = true
	Variable.cameralock = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func CloseInventory():
	print("Close Inventory")
	Variable.InventoryOpen = !Variable.InventoryOpen
	$".".hide()
	Variable.movelock = false
	Variable.cameralock = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func set_description(item : Item_Ressource):
	if name_label != null:
		name_label.text = item.item_title
	else:
		print("null name_label")
	if icon != null:
		icon.texture = item.item_icon
	else:
		print("null icon")
	if description_label != null:
		description_label.text = item.item_description
	else:
		print("null description_label")


func _on_dictionary_manager_item_picked_up(item: Item_Ressource) -> void:
	print("Signal connected successfully!")
	print(item)
	add_item(item)
