class_name HotkeyRebindButton
extends Control

@onready var label: Label = $HBoxContainer/Label as Label
@onready var button: Button = $HBoxContainer/Button as Button

@export var action_name : String = ""
var key_code

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process_unhandled_key_input(false)
	set_action_name()
	set_text_for_key()

func set_action_name() -> void:
	label.text = "Unassign"

	match action_name:
		"move_left":
			label.text = "Move Left"
		"move_right":
			label.text = "Move Right"
		"move_forward":
			label.text = "Move Forward"
		"move_backward":
			label.text = "Move Backward"
		"jump":
			label.text = "Jump"
		"interaction":
			label.text = "Interact"
		"inventory":
			label.text = "Open Inventory"
		"sprint":
			label.text = "Sprint"
		"quest_menu":
			label.text = "Open Quest Menu"
		"documentary":
			label.text = "Open Documentary"

func set_text_for_key():
	var action_events = InputMap.action_get_events(action_name)
	var action_event = action_events[0]
	var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
	button.text = "%s" % action_keycode

func _on_button_toggled(button_pressed):
	if button_pressed:
		print("Button pressed")
		button.text = "Press any key..."
		set_process_unhandled_key_input(button_pressed)
		
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = false
				i.set_process_unhandled_key_input(false)
				
	else:
		
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = true
				i.set_process_unhandled_key_input(false)
		set_text_for_key()



func _unhandled_key_input(event):
	rebind_action_key(event)
	button.button_pressed = false

func rebind_action_key(event):
	InputMap.action_erase_events(action_name)
	InputMap.action_add_event(action_name, event)
	
	set_process_unhandled_key_input(false)
	set_text_for_key()
	set_action_name()


func _on_button_pressed() -> void:
	if button.pressed:
		print("Button pressed")
		button.text = "Press any key..."
		#for key in range(KEY_0, KEY_Z):
			#if Input.is_key_pressed(key):
				#key_code = key
		set_process_unhandled_key_input(true)
		for i in get_tree().get_nodes_in_group("key_group"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = false
				i.set_process_unhandled_key_input(false)
				
	else:
		
		for i in get_tree().get_nodes_in_group("key_group"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = true
				i.set_process_unhandled_key_input(false)
		set_text_for_key() # Replace with function body.
