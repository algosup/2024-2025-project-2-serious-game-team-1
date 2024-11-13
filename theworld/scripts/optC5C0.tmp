extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	if Variable.MouseCapture:
		Variable.CaptureMouseOff()
	if Input.is_action_just_pressed("escape"):
		Variable.GoBack()


func _on_back_button_pressed() -> void:
	Variable.GoBack()

func _on_test_button_toggled(button_pressed):
	if button_pressed:
		print("Button is Pressed")
		$TestButton.text = "Pressed"
	else:
		print("Button is Released")
		$TestButton.text = "Released"


func _on_test_button_pressed() -> void:
	$TestButton.text = "Dommage"
