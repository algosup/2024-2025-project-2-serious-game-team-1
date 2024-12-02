extends Node

@onready var inventory_gestion: Control = %Inventory_Gestion

@warning_ignore("shadowed_global_identifier")
var Item : Item_Ressource

# Dictionary to store items with preloaded resources
var Item_List: Dictionary = {
	"1" : preload("res://assets/items/bin_bag.tres"),
}

# Dictionary to store quests with preloaded resources
var Quest_List: Dictionary = {
	"test" : "res://assets/quests/clean_beach.tres",
}


var completed_quests : Array = []
var active_quests : Array = [null, null, null]

func get_resource_path_quest_list(quest_id: String) -> String:
	print("Quests Search")
	print(active_quests)
	if Quest_List.has(quest_id):
		return Quest_List[quest_id]
	else:
		push_error("Resource not found: " + quest_id)
		return ""

func load_resource_quest_list(quest_id: String):
	var path = get_resource_path_quest_list(quest_id)
	if path != "":
		return load(path)
	else:
		return null

func check_item(object, item: Item_Ressource):
	if item == null:
		print("Error: item is null!")
		return
	if item == Item :
		inventory_gestion.add_item(item)

	# Ensure the item ID is used correctly
	var item_id_as_string = str(item.item_ID)

	if Item_List.has(item_id_as_string):  # Check if the dictionary contains the key
		print("Message before signal emit")
		object.queue_free() 
	else:
		print("Item not recognized! ID: ", item_id_as_string)

# Log quest progress
func log_quest(quest_id: String, status: String) -> void:
	if status == "complete":
		completed_quests.append(quest_id)
	elif status == "active":
		active_quests.append(quest_id)

# Debug print to check dictionaries
func debug_print() -> void:
	print("Item Dictionary:", Item_List)
	print("Quest List Dictionary:", Quest_List)
	print("Complete Quests :", completed_quests)
	print("Active Quests :", active_quests)
