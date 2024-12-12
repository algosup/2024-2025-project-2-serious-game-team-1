# Raycast3D script

extends RayCast3D

@onready var prompt: Label = $Prompt

func _physics_process(_delta: float) -> void:
	if is_colliding():
		var collider = get_collider()
		
		if collider is Interactable:
			prompt.text = collider.get_prompt()
			
			if Input.is_action_just_pressed("interaction"):
				print("Interacted with:", collider)
				
				if collider.is_in_group("item") and collider is Item_Object:
					# Add item to inventory if necessary
					collider.interact(owner)
					collider.pick_up()
				elif collider.is_in_group("pnj") and collider is Pnj:
					if DialogManager.dialog(collider):
						print("Entered dialog with " + str(collider))
					collider.interact(owner)
					
				elif collider.is_in_group("waste"):
					print("Waste object detected.")  # Debug: Waste object is detected
					collider.cleanup()  # Call cleanup if Waste
					prompt.text = collider.prompt_message  # Show the prompt message
				elif collider.is_in_group("other"):
					collider.action()
		else:
			prompt.text = "    "
	else:
		prompt.text = "    "
