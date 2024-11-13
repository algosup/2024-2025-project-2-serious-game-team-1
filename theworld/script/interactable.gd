extends CollisionObject3D

class_name Interactable

@export var prompt_message = "Interact"

func get_prompt():
	var key_name = " "
	for action in InputMap.action_get_events("interaction"):
		if action is InputEventKey:
			key_name = action.as_text_physical_keycode()
			break
			
	return prompt_message + "\n[" + key_name + "]"

func interact(body):
	print(body.name, " Interacted with", name)
