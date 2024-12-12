extends CanvasLayer

signal cinematic_done

var second_play = false

func _ready() -> void:
	$Timer.start()



func _on_timer_timeout() -> void:
	$Timer.stop()
	$Intro_presentation.play()

func _on_intro_presentation_finished() -> void:
	$Intro_presentation.hide()
	$Intro_waking.play()
	
func _on_intro_waking_finished() -> void:
	$Intro_waking.stop()
	$Intro_waking.hide()
	$CanvasLayer.hide()
	$AnimationPlayer.play("TRANSITION")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	emit_signal("cinematic_done")


func _on_button_pressed() -> void:
	$Intro_presentation.stop()
	$Intro_presentation.hide()
	$Intro_waking.stop()
	$Intro_waking.hide()
	
	$AnimationPlayer.play("TRANSITION")
