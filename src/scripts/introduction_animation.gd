extends CanvasLayer

signal sequence_change
signal animation_end

var states: int 

func _ready() -> void:
	states = 0
	
func play_intro():
	#$AnimationPlayer.play("introduction")
	pass
		
func _process(_delta) -> void:
	pass

func _on_sequence_change() -> void:
	states += 1
	if states > 6 :
		states = 0
	match states:
		0:
			$Panel/Bottom_Label.text = " "
			$Panel/Top_Label.text = " "
		1:
			$Panel/Bottom_Label.text = "It was in the 4th century BC that great names such as Aristotle and his pupil Theophrastus began to take an interest in flora and fauna."
			$Panel/Top_Label.text = " "
		2:
			$Panel/Bottom_Label.text = "Thus the concept of ecology was born."
			$Panel/Top_Label.text = " "
		3:
			$Panel/Bottom_Label.text = " "
			$Panel/Top_Label.text = "Their writings travelled down the centuries until the XVIII and XIX centuries, when new names such as Alexander von Humboldt and Charles Darwin took turns in their research."
		4:
			$Panel/Bottom_Label.text = "Then industrial air arrived, accompanied by the principle of climate change, and all this research was lost."
			$Panel/Top_Label.text = " "
		5: 
			$Panel/Bottom_Label.text = " "
			$Panel/Top_Label.text = "Increasing pollution is having catastrophic effects on our planet."
		6:
			$Panel/Bottom_Label.text = " "
			$Panel/Top_Label.text = "While scientists have dated the point of no return to 2045, we are desperately trying to save our planet in 2025 and find those writings that could save us."



func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	self.hide()
	emit_signal("animation_end")
