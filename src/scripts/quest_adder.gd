extends CanvasLayer

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func play_animation():
	$AnimationPlayer.play("doc_received")
	audio_stream_player_2d.play()
