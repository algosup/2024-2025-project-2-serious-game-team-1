extends AudioStreamPlayer

var tracks = [preload("res://assets/music/Enchanted Valley.mp3"), preload("res://assets/music/Morning.mp3")]
var index = 0

@onready var streamPlayed: AudioStreamPlayer = $"."

func playMusic(index):
	streamPlayed.stream = tracks[index]
	streamPlayed.play()
	print("playMusic end " + str(index))

func _on_finished() -> void:
	if len(tracks)-1 <= index:
		index = 0
		print("on finished = 0 " + str(index))
		print("on finished len" + str(len(tracks)))
	else:
		index = index + 1
		print("on finished ++" + str(index))
	
	playMusic(index)


func _on_introduction_animation_cinematic_done() -> void:
	playMusic(index)
	print("intro done =0? " + str(index))
	
