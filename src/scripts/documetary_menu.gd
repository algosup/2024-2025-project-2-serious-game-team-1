extends Control

@onready var title_label: Label = $Panel/Right_page/Title_Label
@onready var rich_text_label: RichTextLabel = $Panel/Right_page/RichTextLabel
@onready var source_label: Label = $Panel/Right_page/Source_Label

func set_documentation(documentation : Documentation_Resource):
	title_label.text = documentation.Documentation_name
	rich_text_label.text = documentation.Documentation_explanation
	source_label.text = documentation.Documentation_source_to_text()

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
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
