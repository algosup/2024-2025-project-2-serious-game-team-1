extends Node

# Dictionary to store items with preloaded resources
var Item: Dictionary = {
	"bin_bag": preload("res://assets/items/bin_bag.tres"),
}

# Dictionary to store quests with preloaded resources
var Quest_List: Dictionary = {
	"clean_beach": preload("res://assets/quests/clean_beach.tres"),
	#creer une ressource avec a l'interieur la condition de victoire qui seras : ramasser 10 plastiques
}

# Dictionary to log quest progress
var Quest_Log: Dictionary = {
	"completed_quests": [],
	"active_quests": []
}

# Add new item to the Item dictionary
func add_item(item_id: String, path: String) -> void:
	# Dynamically preload the resource and add it to the dictionary
	Item[item_id] = preload(path)

# Add new quest to the Quest_List dictionary
func add_quest(quest_id: String, path: String) -> void:
	# Dynamically preload the resource and add it to the dictionary
	Quest_List[quest_id] = preload(path)

# Log quest progress
func log_quest(quest_id: String, status: String) -> void:
	if status == "complete":
		Quest_Log["completed_quests"].append(quest_id)
	elif status == "active":
		Quest_Log["active_quests"].append(quest_id)

# Debug print to check dictionaries
func debug_print() -> void:
	print("Item Dictionary:", Item)
	print("Quest List Dictionary:", Quest_List)
	print("Quest Log Dictionary:", Quest_Log)
