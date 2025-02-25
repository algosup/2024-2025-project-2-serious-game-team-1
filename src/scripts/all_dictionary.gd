extends Node

@warning_ignore("shadowed_global_identifier")
var Item : Item_Ressource

# Dictionary to store items with preloaded resources
var Item_List: Dictionary = {
	"1" : preload("res://assets/items/bin_bag.tres"),
}

# Dictionary to store quests with preloaded resources
var Quest_List: Dictionary = {
	"Clean Beach" : "res://assets/quests/clean_beach.tres",
	"Recycle Plastic" : "res://assets/quests/recycle_plastic.tres",
	"Get data" : "res://assets/quests/get_data.tres",
	"Reconaissance mission" : "res://assets/quests/reconaissance_mission.tres",
	"Solar Connexion" : "res://assets/quests/solar_connexion.tres",
	
	"Introduction" : "res://assets/quests/talk_mayor1.tres",
	"Retrieve the data" : "res://assets/quests/talk_mayor2.tres",
	"Mayor's issue" : "res://assets/quests/talk_mayor3.tres",
	
	"The Legend part 1" : "res://assets/quests/talk_roger1.tres",
	"The Legend part 2" : "res://assets/quests/talk_roger2.tres",
	
	"The legend part 3" : "res://assets/quests/talk_Elie.tres",
	"End of mission" : "res://assets/quests/talk_Elie2.tres",
	
	"A short break" : "res://assets/quests/talk_Martine.tres",
	"A deserved meal" : "res://assets/quests/talk_Martine2.tres"
}

var inventory : Array = [
	null, null, null, null, null,
	null, null, null, null, null,
	null, null, null, null, null,
	null, null, null, null, null, 
]

var NPC_talking = false
var inventorySize : int = 20
enum category {Main_Quest, Secondary_Quest}
var documentation_available = []

var completed_quests : Array = []
var active_main_quests : Array = [null, null, null]
var active_secondary_quests : Array = [null, null, null]

func get_root_node():
	var root_node = get_tree().root
	print("Root node is:", root_node)
	return root_node

func show_documentation_resource(quest_documentation):
	for i in quest_documentation:
		documentation_available.append(i)
	print("New_doc: ", documentation_available)

func add_item(item : Item_Ressource):
	print("singal receive")
	for i in range(inventorySize):
		if inventory[i] == null:
			print("item is not null")
			inventory[i] =  item
			print(item.item_title, "added to slot", i)
			print(inventory)
			return
		print("Inventory full!")

func get_resource_path_quest_list(quest_id: String) -> String:
	print("Quests Search")  
	print(active_main_quests, active_secondary_quests)
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
	var item_id_as_string = str(item.item_ID)
	if Item_List.has(item_id_as_string):  # Check if the dictionary contains the key
		print("Message before signal emit")
		add_item(item)
		object.disappear()
	else:
		print("Item not recognized! ID: ", item_id_as_string)

# Log quest progress
func log_quest(quest_id: String, status: String) -> void:
	if status == "complete":
		completed_quests.append(quest_id)
	elif status == "active":
		if load_resource_quest_list(quest_id).category == category.Main_Quest:
			active_main_quests.append(quest_id)
		if load_resource_quest_list(quest_id).category == category.Secondary_Quest:
			active_secondary_quests.append(quest_id)

# Debug print to check dictionaries
func debug_print() -> void:
	print("Item Dictionary:", Item_List)
	print("Quest List Dictionary:", Quest_List)
	print("Complete Quests :", completed_quests)
	print("Active Main Quests :", active_main_quests)
	print("Active Secondary Quests :", active_secondary_quests)
