extends HBoxContainer

# Declare variables for UI elements
@onready var title_label: Label = $TitleLabel
@onready var speed_slider: HSlider = $SpeedSlider
@onready var speed_percentage_label: Label = $SpeedPercentageLabel

# Variable to store sensitivity value
var current_speed: float = 1.0  # Default sensitivity value (100%)

func _ready() -> void:
	speed_slider.value_changed.connect(_on_sensitivity_slider_changed)
	print("Initializing sensitivity slider")
	speed_slider.min_value = 0.05
	speed_slider.max_value = 1.5
	speed_slider.step = 0.01
	speed_slider.value = current_speed
	speed_percentage_label.text = str(int(current_speed * 100)) + "%"

func _on_sensitivity_slider_changed(value: float) -> void:
	print("Slider value changed: ", value)
	speed_percentage_label.text = str(int(value * 100)) + "%"
	current_speed = value
	apply_mouse_sensitivity(current_speed)


# Function to apply the sensitivity
func apply_mouse_sensitivity(speed: float) -> void:
	print("Applying speed sensitivity: ", speed)
	# Assuming Variable is a global singleton
	Variable.speed_multiplicator = speed
