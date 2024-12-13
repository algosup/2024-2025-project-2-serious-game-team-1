extends HBoxContainer

@onready var title_label: Label = $TitleLabel
@onready var speed_slider: HSlider = $SpeedSlider
@onready var speed_percentage_label: Label = $SpeedPercentageLabel



func _ready() -> void:
	print("Initializing sensitivity slider")
	speed_slider.min_value = 0.05
	speed_slider.max_value = 1.5
	speed_slider.step = 0.01
	speed_slider.value = Variable.speed_multiplicator
	speed_percentage_label.text = str(int(Variable.speed_multiplicator * 100)) + "%"


func _on_speed_slider_value_changed(value: float) -> void:
	print("Slider value changed: ", value)
	speed_percentage_label.text = str(int(value * 100)) + "%"
	Variable.speed_multiplicator = value
