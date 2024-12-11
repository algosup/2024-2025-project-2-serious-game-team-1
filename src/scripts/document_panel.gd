extends Panel

@export var documentation : Documentation_Resource
@onready var documentation_label: Label = $VBoxContainer/Documentation_label
@onready var documentary_menu: Control = $"../../../../.."

func set_documentation_panel():
	documentation_label.text = documentation.Documentation_name

func _on_button_pressed():
	documentary_menu.set_documentation(documentation)
	
func _ready():
	#documentation_label.text = documentation.Documentation_name
	pass 
