extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Variable.MouseCapture:
			Variable.CaptureMouseOff()


func _on_back_button_pressed() -> void:
	Variable.GoBack() # Replace with function body.
