#extends Node
#
#@onready var questlabel: Label = %questlabel
#
#
#var questlog: Array = []
#
#
#func add_to_questlog(quest: Pnj, new_name):
	#if quest.name not in questlog:
		#questlog.append(quest.name)
		#quest_manager(new_name)
		#print("Added ", quest.name, " to the questlog")
	#else:
		#print("You already have this quest")
		#
#func quest_manager(quest: String):
	#if quest == "Roger":
		#questlabel.text = 'pick up 10 plastic wastes'
