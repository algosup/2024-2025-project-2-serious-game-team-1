extends HBoxContainer

@onready var title_label: Label = $TitleLabel
@onready var volume_slider: HSlider = $VolumeSlider
@onready var volume_percentage_label: Label = $VolumePercentageLabel
@export var volume_name : String = ""
var idx_volume_server : int
var PreviousVolume : int

func _ready() -> void:
	set_audio_server()
	set_music_name()
	get_slider()
	basic_volume()

func _process(_delta) -> void:
	set_percentage()
	if PreviousVolume != volume_slider.value:
		Variable.ChangeVolume = !Variable.ChangeVolume

func set_audio_server():
	for i in range(len(Variable.VolumeList)):
		if volume_name == Variable.VolumeList[i]:
			idx_volume_server = i

func basic_volume():
	PreviousVolume = volume_slider.value

func set_music_name() -> void:
	title_label.text = "Unassign"

	match volume_name:
		"master":
			title_label.text = "     Master Volume"
		"music":
			title_label.text = "     Music Volume"
		"sound effect":
			title_label.text = "     Sound Effect Volume"
		"dialogue":
			title_label.text = "     Dialogue Volume"

func get_slider():
	$VolumeSlider.value = db_to_linear(AudioServer.get_bus_volume_db(idx_volume_server))

func set_percentage():
	var percentage = $VolumeSlider.value * 100
	$VolumePercentageLabel.text = "%s %%" % percentage

func set_slider():
	print("AUDIO SET")
	AudioServer.set_bus_volume_db(idx_volume_server, linear_to_db($VolumeSlider.value))
	Variable.ChangeVolume = false
