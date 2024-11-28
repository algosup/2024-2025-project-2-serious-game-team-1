extends Interactable

class_name Pnj

@onready var player: CharacterBody3D = %Player


@onready var dialogue_box: DialogueBox = $CanvasLayer/DialogueBox

@export var Pnj_name: String = "Insert Pnj name"

var talking = false
var queststarted = false

func _ready() -> void:
	talking = false
	queststarted = false

func pnj_talk():
	if talking == false :
		talking = true
		Variable.movelock = true
		Variable.cameralock = true
		$CanvasLayer/DialogueBox.start()
		

func _on_dialogue_box_dialogue_signal(value):
	var quest_id : String
	AllDictionary.debug_print()
	print("start to talk with roger")
	if value != "quest" and value != "end":
		quest_id = value
	if value == 'quest':
		queststarted = true
		for i in range(len(AllDictionary.active_quests)):
			if AllDictionary.active_quests[i] == null:
				AllDictionary.active_quests[i] = quest_id
				print("Quests Added")
				print("Quests Active Liste:", AllDictionary.active_quests)
				break
		print("You cannot have more quests")
	if value == 'end':
		print('end')
		Variable.movelock = false
		Variable.cameralock = false
		talking = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	print(str(value))
	AllDictionary.debug_print()
