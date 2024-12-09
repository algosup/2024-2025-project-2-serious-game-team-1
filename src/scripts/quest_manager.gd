extends Node

var tutorial_quest = preload("res://assets/quests/tutorial.tres")

func _process(_delta) -> void:
	if tutorial_quest in AllDictionary.active_quests:
		pass

func goal_text(quest : Quests_Resources):
	if quest.quests_goal_objective == 0:
		return quest.quests_goal_label_part1
	else:
		return quest.quests_goal_label_part1 + " " + str(quest.quests_goal_counter) + "/" + str(quest.quests_goal_objective) + " " +quest.quests_goal_label_part2
