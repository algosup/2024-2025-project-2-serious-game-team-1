extends Node

# Dictionary to store items with their names and paths
var Dictionary_item: Dictionary = {
	"Default item": "res"
}

# Dictionary to store quests with their names and paths
var Quest_List: Dictionary = {}

# Array to log active/completed quest names
var Quest_Log: Array = []


#func recup_item(item_name):
	#return Dictionary_item[item_name]
# Function to add an item
#func add_item(item_name: String):
	#if item_name not in :
		#inventory.append(item_name)
		#print("Added ", item_name, " to inventory.")
		#item_name.pick_up()
	#else:
		#print(item.name, "is already in inventory.")

# Function to add a quest
func add_quest(quest_name: String, quest_path: String) -> void:
	Quest_List[quest_name] = quest_path

# Function to log a quest
func log_quest(quest_name: String) -> void:
	if Quest_List.has(quest_name):
		Quest_Log.append(quest_name)
	else:
		print("Quest not found: %s" % quest_name)

#USAGE EXEMPLE
## Adding items
#Dictionary.add_item("Sword", "res://Items/Sword.tres")
#Dictionary.add_item("Shield", "res://Items/Shield.tres")
#
## Adding quests
#Dictionary.add_quest("Find the Sword", "res://Quests/FindSword.tres")
#Dictionary.add_quest("Defeat the Dragon", "res://Quests/DefeatDragon.tres")
#
## Logging a quest
#Dictionary.log_quest("Find the Sword")
#
## Accessing data
#print(Dictionary.Item) # {"Sword": "res://Items/Sword.tres", "Shield": "res://Items/Shield.tres"}
#print(Dictionary.Quest_List) # {"Find the Sword": "res://Quests/FindSword.tres", "Defeat the Dragon": "res://Quests/DefeatDragon.tres"}
#print(Dictionary.Quest_Log) # ["Find the Sword"]
