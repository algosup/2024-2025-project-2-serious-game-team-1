extends Control

@onready var quests_panel_slot_1: Panel = $Panel/VBoxContainer/quests_panel_slot_1
@onready var quests_panel_slot_2: Panel = $Panel/VBoxContainer/quests_panel_slot_2
@onready var quests_panel_slot_3: Panel = $Panel/VBoxContainer/quests_panel_slot_3

@onready var quest_menu: Control = %quest_menu

@onready var quests_panel_1: Panel = $"Quest_Panel/TabContainer/Current Quests/Currents Quests/quests_panel1"
@onready var quests_panel_2: Panel = $"Quest_Panel/TabContainer/Current Quests/Currents Quests/quests_panel2"
@onready var quests_panel_3: Panel = $"Quest_Panel/TabContainer/Current Quests/Currents Quests/quests_panel3"


func set_quests():
	if quests_panel_1.quests != null :
		quests_panel_slot_1.quests = quests_panel_1.quests
	if quests_panel_2.quests != null :
		quests_panel_slot_2.quests = quests_panel_2.quests
	if quests_panel_3.quests != null :
		quests_panel_slot_3.quests = quests_panel_3.quests
