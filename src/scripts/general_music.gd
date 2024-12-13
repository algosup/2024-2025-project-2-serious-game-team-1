extends AudioStreamPlayer

var menu_music = preload("res://assets/music/instrumental-ambient-calming-269887.mp3")
var tracks = [preload("res://assets/music/Enchanted Valley.mp3"), preload("res://assets/music/Morning.mp3")]
var index = 0

@onready var streamPlayed: AudioStreamPlayer = $"."
@onready var streamMenu: AudioStreamPlayer = $"."

func playMusic(index):
	streamPlayed.stream = tracks[index]
	streamPlayed.play()

func _on_finished() -> void:
	if len(tracks)-1 <= index:
		index = 0
	else:
		index = index + 1
	playMusic(index)

func _on_introduction_animation_cinematic_done() -> void:
	playMusic(index)
	
	
func _on_play_button_pressed() -> void:
	streamMenu.stream_paused = true
