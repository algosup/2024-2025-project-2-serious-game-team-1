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
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		player.movelock = true
		player.camera_manager.CameraLock = true
		print(player.camera_manager.CameraLock)
		$CanvasLayer/DialogueBox.start()
		

func _on_dialogue_box_dialogue_signal(value):
	if value == 'quest':
		queststarted = true
		QuestList.add_to_questlog(self, name)
	if value == 'end':
		print('end')
		player.movelock = false
		player.camera_manager.CameraLock = false
		talking = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
