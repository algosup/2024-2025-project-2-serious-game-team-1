extends CanvasLayer

signal full_coverage

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var progress_bar: ProgressBar = $Panel/ProgressBar

func _update_progress_bar(new_value : float) -> void:
	progress_bar.set_value_no_signal(new_value * 100)
	
func start_outro_animation() -> void:
	if animation_player.is_playing():
		await Signal(animation_player, "animation_finished")
	animation_player.play("end_load")
	await Signal(animation_player, "animation_finished")
	self.queue_free()
