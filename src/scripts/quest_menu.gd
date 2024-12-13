extends Control

@onready var name_label: Label = $Quest_Panel/Description/DescriptionBox/HBoxContainer4/NameLabel
@onready var description_label: RichTextLabel = $Quest_Panel/Description/DescriptionBox/HBoxContainer3/DescriptionLabel
@onready var zone_label: Label = $Quest_Panel/Description/DescriptionBox/HBoxContainer/ZoneLabel
@onready var giver_label: Label = $Quest_Panel/Description/DescriptionBox/HBoxContainer/GiverLabel
@onready var goal_label: Label = $Quest_Panel/Description/DescriptionBox/HBoxContainer2/GoalLabel
@onready var quests_panel_1: Panel = $"Quest_Panel/TabContainer/Current Quests/Currents Main Quests/quests_panel1"
@onready var quests_panel_2: Panel = $"Quest_Panel/TabContainer/Current Quests/Currents Main Quests/quests_panel2"
@onready var quests_panel_3: Panel = $"Quest_Panel/TabContainer/Current Quests/Currents Main Quests/quests_panel3"
@onready var quests_panel_4: Panel = $"Quest_Panel/TabContainer/Current Quests/Currents Secondary Quests/quests_panel4"
@onready var quests_panel_5: Panel = $"Quest_Panel/TabContainer/Current Quests/Currents Secondary Quests/quests_panel5"
@onready var quests_panel_6: Panel = $"Quest_Panel/TabContainer/Current Quests/Currents Secondary Quests/quests_panel6"


func OpenQuestMenu():
	print("Open Quest Menu")
	Variable.QuestMenuOpen = !Variable.QuestMenuOpen
	$".".show()
	Variable.movelock = true
	Variable.cameralock = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	set_quests()

func CloseQuestMenu():
	print("Close Quest Menu")
	Variable.QuestMenuOpen = !Variable.QuestMenuOpen
	$".".hide()
	Variable.movelock = false
	Variable.cameralock = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	set_description(null)

func set_quests():
	if AllDictionary.active_main_quests[0] != null and AllDictionary.active_main_quests[0] != "":
		var quest_id : String = AllDictionary.active_main_quests[0]
		quests_panel_1.quests = AllDictionary.load_resource_quest_list(quest_id)
	else:
		quests_panel_1.quests = null
	if AllDictionary.active_main_quests[1] != null and AllDictionary.active_main_quests[1] != "":
		var quest_id : String = AllDictionary.active_main_quests[1]
		quests_panel_2.quests = AllDictionary.load_resource_quest_list(quest_id)
	else:
		quests_panel_2.quests = null
	if AllDictionary.active_main_quests[2] != null and AllDictionary.active_main_quests[2] != "":
		var quest_id : String = AllDictionary.active_main_quests[2]
		quests_panel_3.quests = AllDictionary.load_resource_quest_list(quest_id)
	else:
		quests_panel_3.quests = null
	if AllDictionary.active_secondary_quests[0] != null and AllDictionary.active_secondary_quests[0] != "":
		var quest_id : String = AllDictionary.active_secondary_quests[0]
		quests_panel_4.quests = AllDictionary.load_resource_quest_list(quest_id)
	else:
		quests_panel_4.quests = null
	if AllDictionary.active_secondary_quests[1] != null and AllDictionary.active_secondary_quests[1] != "":
		var quest_id : String = AllDictionary.active_secondary_quests[1]
		quests_panel_5.quests = AllDictionary.load_resource_quest_list(quest_id)
	else:
		quests_panel_5.quests = null
	if AllDictionary.active_secondary_quests[2] != null and AllDictionary.active_secondary_quests[2] != "":
		var quest_id : String = AllDictionary.active_secondary_quests[2]
		quests_panel_6.quests = AllDictionary.load_resource_quest_list(quest_id)
	else:
		quests_panel_6.quests = null

func set_description(Quests : Quests_Resources):
	if Quests != null:
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
			goal_label.text = QuestManager.goal_text(Quests)
		else:
			print("null goal_label")
		if description_label != null:
			description_label.text = "Description : " + Quests.quests_description
		else:
			print("null description_label")
	else:
		name_label.text = ""
		zone_label.text = ""
		giver_label.text = ""
		goal_label.text = ""
		description_label.text = ""
