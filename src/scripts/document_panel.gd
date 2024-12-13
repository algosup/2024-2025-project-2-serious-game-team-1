extends Panel

@export var documentation : Documentation_Resource
@onready var documentary_menu: Control = $"../../../../../.."
@onready var documentation_label: Label = $VBoxContainer/Documentation_label

func set_documentation_panel():
	documentation_label.text = documentation.Documentation_name
	if self.visible:
		$"../Label".show()
		$"../HSeparator".show()

func show_documentation():
	if AllDictionary.documentation_available.has(documentation.Documentation_name):
		self.show()

func _on_button_pressed():
	documentary_menu.set_documentation(documentation)
	
func _ready():
	documentation_label.text = documentation.Documentation_name 
