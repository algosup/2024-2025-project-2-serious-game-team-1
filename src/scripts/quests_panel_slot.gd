extends Panel

@export var quests : Quests_Resources

@onready var quest_label: Label = $VBoxContainer/quest_label
@onready var goal_label: Label = $VBoxContainer/goal_label

@onready var quests_panel_slot: Panel = $"."
@onready var quests_panel: Control = $"../../.."


func _process(_delta):
	if quests != null:
		quest_label.text = quests.quests_name
		goal_label = QuestManager.goal_text(quests)
		var vbox_size = Vector2(quests_panel_slot.get_size().x, quest_label.get_size().y + goal_label.get_size().y + 20)
		quests_panel_slot.set_size(vbox_size)
	else:
		quest_label.text = "Empty Quest Slot"
		
