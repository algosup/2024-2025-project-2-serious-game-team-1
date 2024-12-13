extends Panel

@export var quests : Quests_Resources

@onready var quest_label: Label = %QuestLabel
@onready var zone_label: Label = %ZoneLabel
@onready var pnj_giver_label: Label = %PnjGiverLabel

@onready var base = $"../../../../.."

func _process(_delta):
	if quests != null:
		quest_label.text = quests.quests_name
		var zone_text = "Zone : %s" % quests.quests_zone
		zone_label.text = zone_text
		var giver_text = "Giver : %s" % quests.quests_giver
		pnj_giver_label.text = giver_text
	else:
		quest_label.text = "Empty Quest Slot"
		zone_label.text = "Zone : Unknown"
		pnj_giver_label.text = "Giver : Unknown"
	if Input.is_action_just_pressed("quest_menu"):
		showCompletePanelQuests()


func _on_quests_button_pressed() -> void:
	if quests != null:
		base.set_description(quests)
		
func showCompletePanelQuests():
	if quests.quests_name in AllDictionary.completed_quests:
		$".".show()
	else:
		$".".hide()
