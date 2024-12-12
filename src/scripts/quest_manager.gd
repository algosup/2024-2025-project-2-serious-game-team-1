extends Node
 

func goal_text(quest : Quests_Resources):
	if quest.quests_goal_objective == 0:
		return "Goal : " + quest.quests_goal_label_part1
	else:
		return "Goal : " + quest.quests_goal_label_part1 + " " + str(quest.quests_goal_counter) + "/" + str(quest.quests_goal_objective) + " " +quest.quests_goal_label_part2
		
 
	
