extends Resource

class_name Quests_Resources

@export var quests_name : String
enum category {Main_Quest, Secondary_Quest}
@export var quests_category : category
@export var quests_giver : String
@export var quests_ecopoint : int
@export var quests_zone : String
@export var quests_goal_label_part1 : String
@export var quests_goal_label_part2 : String
@export var quests_goal_counter : int
@export var quests_goal_objective : int
@export_multiline var quests_description : String
@export var quests_next_quests : Quests_Resources
@export var quest_state : int = 0 
# state 0 : unavailable
# state 1 : available
# state 2 : active
# state 3 : completed 
@export var quest_documentation : Array[String] = []

func add_counter():
	if quest_state  == 2: 
		quests_goal_counter += 1
		print(quests_goal_objective - quests_goal_counter)
		if quests_goal_counter == quests_goal_objective:
			quest_state = 3
			print("Quest :", quests_name, " is at the state :", quest_state)
			print("Quest have been shift")
			shift_quest()

func shift_quest():
	if quests_category == category.Main_Quest:
		for i in range(len(AllDictionary.active_main_quests)):
			if AllDictionary.active_main_quests[i] == quests_name:
				print("quest found")
				if !AllDictionary.completed_quests.has(AllDictionary.active_main_quests[i]):
					AllDictionary.completed_quests.append(AllDictionary.active_main_quests[i])
					print("quest has been added to the array completed quests: ", AllDictionary.completed_quests)
					EcoFollow.set_new_eco(quests_zone, quests_ecopoint)
					AllDictionary.show_documentation_resource(quest_documentation)
				if quests_next_quests != null:
					AllDictionary.active_main_quests[i] = quests_next_quests.quests_name
					print("quest has been changed: ", AllDictionary.active_main_quests[i])
					print(AllDictionary.active_main_quests)
				else:
					AllDictionary.active_main_quests[i] = null
				break
	elif quests_category == category.Secondary_Quest:
		for i in range(len(AllDictionary.active_secondary_quests)):
			if AllDictionary.active_secondary_quests[i] == quests_name:
				if !AllDictionary.completed_quests.has(AllDictionary.active_secondary_quests[i]):
					AllDictionary.completed_quests.append(AllDictionary.active_secondary_quests[i])
				if quests_next_quests != null:
					AllDictionary.active_secondary_quests[i] = quests_next_quests.quests_name
					print(AllDictionary.active_secondary_quests)
				else:
					AllDictionary.active_secondary_quests[i] = null
			break
	else:
		print("categorie not found")
