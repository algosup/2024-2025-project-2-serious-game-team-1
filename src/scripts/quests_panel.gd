extends Control

@onready var quests_panel_slot_1: Panel = $"Panel/VBoxContainer/Main Quests/quests_panel_slot_1"
@onready var quests_panel_slot_2: Panel = $"Panel/VBoxContainer/Main Quests/quests_panel_slot_2"
@onready var quests_panel_slot_3: Panel = $"Panel/VBoxContainer/Main Quests/quests_panel_slot_3"
@onready var quests_panel_slot_4: Panel = $"Panel/VBoxContainer/Secondary Quests/quests_panel_slot_4"
@onready var quests_panel_slot_5: Panel = $"Panel/VBoxContainer/Secondary Quests/quests_panel_slot_5"
@onready var quests_panel_slot_6: Panel = $"Panel/VBoxContainer/Secondary Quests/quests_panel_slot_6"
@onready var label: Label = $"Panel/VBoxContainer/Main Quests/Label"
@onready var v_box_container: VBoxContainer = $Panel/VBoxContainer

func set_quests():
	if AllDictionary.active_main_quests[0] != null and AllDictionary.active_main_quests[0] != "":
		var quest_id : String = AllDictionary.active_main_quests[0]
		quests_panel_slot_1.quests = AllDictionary.load_resource_quest_list(quest_id)
	else:
		quests_panel_slot_1.quests = null
	if AllDictionary.active_main_quests[1] != null and AllDictionary.active_main_quests[1] != "":
		var quest_id : String = AllDictionary.active_main_quests[1]
		quests_panel_slot_2.quests = AllDictionary.load_resource_quest_list(quest_id)
	else:
		quests_panel_slot_2.quests = null
	if AllDictionary.active_main_quests[2] != null and AllDictionary.active_main_quests[2] != "":
		var quest_id : String = AllDictionary.active_main_quests[2]
		quests_panel_slot_3.quests = AllDictionary.load_resource_quest_list(quest_id)
	else:
		quests_panel_slot_3.quests = null
	if AllDictionary.active_secondary_quests[0] != null and AllDictionary.active_secondary_quests[0] != "":
		var quest_id : String = AllDictionary.active_secondary_quests[0]
		quests_panel_slot_4.quests = AllDictionary.load_resource_quest_list(quest_id)
	else:
		quests_panel_slot_4.quests = null
	if AllDictionary.active_secondary_quests[1] != null and AllDictionary.active_secondary_quests[1] != "":
		var quest_id : String = AllDictionary.active_secondary_quests[1]
		quests_panel_slot_5.quests = AllDictionary.load_resource_quest_list(quest_id)
	else:
		quests_panel_slot_5.quests = null
	if AllDictionary.active_secondary_quests[2] != null and AllDictionary.active_secondary_quests[2] != "":
		var quest_id : String = AllDictionary.active_secondary_quests[2]
		quests_panel_slot_6.quests = AllDictionary.load_resource_quest_list(quest_id)
	else:
		quests_panel_slot_6.quests = null

func set_panel_size():
	var panel_size = Vector2(quests_panel_slot_1.get_size().x, label.get_size().y + quests_panel_slot_1.get_size().y + quests_panel_slot_2.get_size().y + quests_panel_slot_3.get_size().y)
	$".".set_size(panel_size)
	v_box_container.force_update_transform()

func HideQuestsPanels():
	$Panel.hide()

func ShowQuestsPanels():
	$Panel.show()
