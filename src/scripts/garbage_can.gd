extends Interactable

@onready var rigidbody = self

var recycle_plastic_quest = preload("res://assets/quests/recycle_plastic.tres")
var bin_bag = preload("res://assets/items/bin_bag.tres")

func action():
	var bin_bag_id : int
	if AllDictionary.active_main_quests.has("Recycle Plastic") or AllDictionary.active_secondary_quests.has("Recycle Plastic"):
		for i in range(len(AllDictionary.inventory)):
			if AllDictionary.inventory[i] == bin_bag:
				bin_bag_id = i
				break
		AllDictionary.inventory[bin_bag_id] = null
		print("Bin bag discard")
		$"../bin bag".appear()
		recycle_plastic_quest.quest_state = 3
		%quests_panel.set_quests()
		%quest_menu.set_quests()
