extends Node

# Dictionary to store items with preloaded resources
var Item_List: Dictionary = {
	"1" : preload("res://assets/items/bin_bag.tres")
}

# Dictionary to store quests with preloaded resources
var Quest_List: Dictionary = {
	"1": preload("res://assets/quests/clean_beach.tres"),
	#creer une ressource avec a l'interieur la condition de victoire qui seras : ramasser 10 plastiques
}

# Dictionary to log quest progress
var Quest_Log: Dictionary = {
	"completed_quests": [],
	"active_quests": []
}

# Log quest progress
func log_quest(quest_id: String, status: String) -> void:
	if status == "complete":
		Quest_Log["completed_quests"].append(quest_id)
	elif status == "active":
		Quest_Log["active_quests"].append(quest_id)

# Debug print to check dictionaries
func debug_print() -> void:
	print("Item Dictionary:", Item_List)
	print("Quest List Dictionary:", Quest_List)
	print("Quest Log Dictionary:", Quest_Log)
