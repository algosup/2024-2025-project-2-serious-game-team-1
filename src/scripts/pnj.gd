extends Interactable

class_name Pnj

signal call_areas

@onready var player: CharacterBody3D = %Player


@onready var quest_adder: CanvasLayer = $Quest_Adder
@onready var dialogue_box: DialogueBox = $CanvasLayer/DialogueBox
@onready var mesh: Node3D = $Mesh
@onready var player_ui: Control = %Player_UI
@export var Pnj_name: String = "Insert Pnj name"
@export var quest_name : String = "None"
enum category {Main_Quest, Secondary_Quest}

var quest_id : String

var previous_rotation : float 

func _ready() -> void:
	previous_rotation = rotation.y
	Variable.talking = false
	

func pnj_talk():
	if Variable.talking == false :
		rotation.y = player.camera_manager._camera_yaw.rotation.y
		Variable.talking = true
		Variable.movelock = true
		Variable.cameralock = true
		$CanvasLayer/DialogueBox.start()
		

func _on_dialogue_box_dialogue_signal(value):
	AllDictionary.NPC_talking = true
	AllDictionary.debug_print()
	print("start to talk with" + str(self))
	if value == "get_quest":
		print(value)
		quest_id = str(quest_name)
		quest_adder.play_animation()
	if value == 'quest':
		var quest : Quests_Resources  = AllDictionary.load_resource_quest_list(quest_id)
		if quest.quests_category == category.Main_Quest:
			for i in range(len(AllDictionary.active_main_quests)):
				if AllDictionary.active_main_quests[i] != quest_id:
					if AllDictionary.active_main_quests[i] == null:
						AllDictionary.active_main_quests[i] = quest_id
						print("Valeur de i : " + str(i))
						quest.quest_state = 2
						print(quest.quests_name + "")
						print("Quests Added")
						print("Quests Active Liste:", AllDictionary.active_main_quests)
						emit_signal("call_areas")
						break
				else:
					print("You have already this quest") 
		if quest.quests_category == category.Secondary_Quest:
			for i in range(len(AllDictionary.active_secondary_quests)):
				if AllDictionary.active_secondary_quests[i] != quest_id:
					if AllDictionary.active_secondary_quests[i] == null:
						AllDictionary.active_secondary_quests[i] = quest_id
						print("Valeur de i : " + str(i))
						quest.quest_state = 2
						print(quest.quests_name + "")
						print("Quests Added")
						print("Quests Active Liste:", AllDictionary.active_secondary_quests)
						break
				else:
					print("You have already this quest") 
		else:
			print("We don't find quest's category")
		print("You cannot have more quests")
	if value == 'talking':
		print('talking')
		mesh.anim_tree.set("parameters/conditions/can_talk", true)
		mesh.talking()
	if value == 'end':
		print('end')
		%quest_menu.set_quests()
		%quests_panel.set_quests()
		mesh.anim_tree.set("parameters/conditions/can_talk", false)
		mesh.talking()
		Variable.movelock = false
		Variable.cameralock = false
		Variable.talking = false
		rotation.y = previous_rotation
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		AllDictionary.NPC_talking = false
	print(str(value))
	AllDictionary.debug_print()
