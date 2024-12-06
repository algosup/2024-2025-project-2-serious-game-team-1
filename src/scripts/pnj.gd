extends Interactable

class_name Pnj

@onready var player: CharacterBody3D = %Player


@onready var dialogue_box: DialogueBox = $CanvasLayer/DialogueBox
@onready var mesh: Node3D = $Mesh
@onready var player_ui: Control = %Player_UI
@export var Pnj_name: String = "Insert Pnj name"

var talking = false
var queststarted = false
var quest_id : String

var previous_rotation : float 

func _ready() -> void:
	previous_rotation = rotation.y
	talking = false
	queststarted = false
	

func pnj_talk():
	if talking == false :
		rotation.y = player.camera_manager._camera_yaw.rotation.y
		talking = true
		Variable.movelock = true
		Variable.cameralock = true
		$CanvasLayer/DialogueBox.start()
		

func _on_dialogue_box_dialogue_signal(value):
	AllDictionary.debug_print()
	print("start to talk with" + str(self))
	if value == "test":
		print(value)
		quest_id = str(value)
	if value == 'quest':
		queststarted = true
		for i in range(len(AllDictionary.active_quests)):
			if AllDictionary.active_quests[i] != quest_id:
				if AllDictionary.active_quests[i] == null:
					AllDictionary.active_quests[i] = quest_id
					print("Quests Added")
					print("Quests Active Liste:", AllDictionary.active_quests)
					break
			else:
				print("You have already this quest")
				break
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
		talking = false
		rotation.y = previous_rotation
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
	print(str(value))
	AllDictionary.debug_print()
