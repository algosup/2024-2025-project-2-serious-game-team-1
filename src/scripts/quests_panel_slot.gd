extends Panel

@export var quests : Quests_Resources

@onready var quest_label: Label = $VBoxContainer/quest_label
@onready var zone_label: Label = $VBoxContainer/zone_label
@onready var goal_label: Label = $VBoxContainer/goal_label

func _process(_delta):
	if quests != null:
		quest_label.text = quests.quests_name
		var zone_text = "Zone : %s" % quests.quests_zone
		zone_label.text = zone_text
		var goal_counter = str(quests.quests_goal_counter) + "/" + str(quests.quests_goal_objective)
		var goal_text = "Goal : "+ quests.quests_goal_label_part1 + " " + goal_counter + " " + quests.quests_goal_label_part2
		goal_label.text = goal_text
	else:
		quest_label.text = "Empty Quest Slot"
		zone_label.text = "Zone : Unknown"
		goal_label.text = "Goal : Unknown"
