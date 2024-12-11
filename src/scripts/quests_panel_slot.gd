extends Panel

@export var quests : Quests_Resources

@onready var quest_label: Label = $HBoxContainer/VBoxContainer/quest_label
@onready var goal_label: Label = $HBoxContainer/VBoxContainer/goal_label

@onready var quests_panel_slot: Panel = $"."
@onready var quests_panel: Control = $"../../../.."

func _process(_delta):
	if quests != null:
		quest_label.text = quests.quests_name
		goal_label.text = QuestManager.goal_text(quests)
		var vbox_size = Vector2(quests_panel_slot.get_size().x, quest_label.get_size().y + goal_label.get_size().y + 20)
		quests_panel_slot.set_size(vbox_size)
		if quests.quest_state == 3:
			quests.shift_quest()
			quests_panel.set_quests()
	else:
		quest_label.text = "Empty Quest Slot"
		
