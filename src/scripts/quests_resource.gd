extends Resource

class_name Quests_Resources

@export var quests_name : String
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

func add_counter():
	if quest_state  == 2: 
		quests_goal_counter += 1
		
	if quests_goal_counter == quests_goal_objective:
		quest_state = 3
			
			
func shift_quest():
	for i in range(len(AllDictionary.active_quests)):
		if AllDictionary.active_quests[i] == quests_name:
			AllDictionary.completed_quests[i] = AllDictionary.active_quests[i]
			AllDictionary.active_quests[i] = quests_next_quests.quest_name
			print(AllDictionary.active_quests)
			
