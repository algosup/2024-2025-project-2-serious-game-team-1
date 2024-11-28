extends Control

@onready var name_label: Label = $Quest_Panel/Description/DescriptionBox/NameLabel
@onready var description_label: RichTextLabel = $Quest_Panel/Description/DescriptionBox/DescriptionLabel
@onready var zone_label: Label = $Quest_Panel/Description/DescriptionBox/HBoxContainer/ZoneLabel
@onready var giver_label: Label = $Quest_Panel/Description/DescriptionBox/HBoxContainer/GiverLabel
@onready var goal_label: Label = $Quest_Panel/Description/DescriptionBox/GoalLabel
@onready var quests_panel_1: Panel = $Quest_Panel/GridQuest/quests_panel1
@onready var quests_panel_2: Panel = $Quest_Panel/GridQuest/quests_panel2
@onready var quests_panel_3: Panel = $Quest_Panel/GridQuest/quests_panel3

func OpenQuestMenu():
	print("Open Quest Menu")
	Variable.QuestMenuOpen = !Variable.QuestMenuOpen
	$".".show()
	Variable.movelock = true
	Variable.cameralock = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func CloseQuestMenu():
	print("Close Quest Menu")
	Variable.QuestMenuOpen = !Variable.QuestMenuOpen
	$".".hide()
	Variable.movelock = false
	Variable.cameralock = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(_delta):
	if AllDictionary.active_quests[0] != null:
		var quest_id : String = AllDictionary.active_quests[0]
		quests_panel_1.quests = AllDictionary.load_resource_quest_list(quest_id)
	if AllDictionary.active_quests[1] != null:
		var quest_id : String = AllDictionary.active_quests[1]
		quests_panel_2.quests = AllDictionary.load_resource_quest_list(quest_id)
	if AllDictionary.active_quests[2] != null:
		var quest_id : String = AllDictionary.active_quests[2]
		quests_panel_3.quests = AllDictionary.load_resource_quest_list(quest_id)


func set_description(Quests : Quests_Resources):
	if name_label != null:
		name_label.text = Quests.quests_name
	else:
		print("null name_label")
	if zone_label != null:
		var zone_text = "Zone : %s" % Quests.quests_zone
		zone_label.text = zone_text
	else:
		print("null zone_label")
	if giver_label != null:
		var giver_text = "Giver : %s" % Quests.quests_giver
		giver_label.text = giver_text
	else:
		print("null giver_label")
	if goal_label != null:
		var goal_counter = str(Quests.quests_goal_counter) + "/" + str(Quests.quests_goal_objective)
		var goal_text = "Goal : "+ Quests.quests_goal_label_part1 + " " + goal_counter + " " + Quests.quests_goal_label_part2
		goal_label.text = goal_text
	else:
		print("null goal_label")
	if description_label != null:
		description_label.text = "Description : " + Quests.quests_description
	else:
		print("null description_label")
