extends Control


func OpenDoc() -> void:
	Variable.DocumentaryMenuOpen = !Variable.DocumentaryMenuOpen
	$".".show()
	Variable.movelock = true
	Variable.cameralock = true

func CloseDoc():
	Variable.DocumentaryMenuOpen = !Variable.DocumentaryMenuOpen
	$".".hide()
	Variable.movelock = false
	Variable.cameralock = false
