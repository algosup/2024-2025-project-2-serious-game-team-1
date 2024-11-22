extends Control


func _ready():
	# Set the minimum size in project settings
	ProjectSettings.set_setting("display/window/size/min_width", Variable.min_size.x)
	ProjectSettings.set_setting("display/window/size/min_height", Variable.min_size.y)
	
	# Enforce the minimum window size using DisplayServer
	DisplayServer.window_set_min_size(Variable.min_size)

var Scale : Dictionary = {
	"Auto" : "",
	"Small" : "",
	"Medium" : "",
	"Large" : "",
}

func _process(_delta: float) -> void:
	if Variable.current_size.x < Variable.min_size.x or Variable.current_size.y < Variable.min_size.y:
		DisplayServer.window_set_size(Vector2i(max(Variable.current_size.x, Variable.min_size.x), max(Variable.current_size.y, Variable.min_size.y)))

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



func _on_confirm_button_pressed() -> void:
	$MarginContainer/VBoxContainer/TabContainer/Sound/VolumeManager1.set_slider()
	$MarginContainer/VBoxContainer/TabContainer/Sound/VolumeManager2.set_slider()
	$MarginContainer/VBoxContainer/TabContainer/Sound/VolumeManager3.set_slider()
	$MarginContainer/VBoxContainer/TabContainer/Sound/VolumeManager4.set_slider()
