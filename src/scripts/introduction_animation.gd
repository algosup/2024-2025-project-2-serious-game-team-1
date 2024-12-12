extends CanvasLayer

signal cinematic_done

var second_play = false

func _ready() -> void:
	$Timer.start()



func _on_timer_timeout() -> void:
	$Intro_presentation.play()

func _on_intro_presentation_finished() -> void:
	
	$Intro_presentation.play()
	
func _on_intro_waking_finished() -> void:
	$AnimationPlayer.play("TRANSITION")
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	emit_signal("cinematic_done")
