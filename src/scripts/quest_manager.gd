extends Node

var tutorial_quest = preload("res://assets/quests/tutorial.tres")


func _process(_delta) -> void:
	if tutorial_quest in AllDictionary.active_quests:
		pass
