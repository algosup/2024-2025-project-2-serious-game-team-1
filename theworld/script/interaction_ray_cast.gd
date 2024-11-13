# Raycast3D script

extends RayCast3D

@onready var prompt: Label = $Prompt

func _physics_process(delta: float) -> void:
	if is_colliding():
		var collider = get_collider()
		
		if collider is Interactable:
			prompt.text = collider.get_prompt()
			
			if Input.is_action_just_pressed("interaction"):
				print("Interacted with:", collider)
				
				if collider.is_in_group("item") and collider is Item:
					# Add item to inventory if necessary, or pick up if nothing is in hand
					if EcoFollow.add_to_inventory(collider):
						print("Added to inventory")
					else:
						print("Picked up and in hand:", collider.item_name)
					collider.interact(owner)
		else:
			prompt.text = " "
