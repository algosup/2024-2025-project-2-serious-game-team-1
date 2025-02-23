extends Control

@onready var title_label: Label = $Panel/Right_page/Title_Label
@onready var rich_text_label: RichTextLabel = $Panel/Right_page/RichTextLabel
@onready var source_label: Label = $Panel/Right_page/Source_Label
@onready var doc_adder: CanvasLayer = $doc_adder
@onready var climate_change: Panel = $Panel/Left_page/Documents_Types_Container/Documentation/Climate_change/Climate_Change
@onready var forest_fires: Panel = $Panel/Left_page/Documents_Types_Container/Documentation/Forest/Forest_fires
@onready var coal: Panel = $"Panel/Left_page/Documents_Types_Container/Documentation/Fossil_energies_&_Renewable_energies/Coal"
@onready var fossil_fuels: Panel = $"Panel/Left_page/Documents_Types_Container/Documentation/Fossil_energies_&_Renewable_energies/Fossil_fuels"
@onready var renewable_energies: Panel = $"Panel/Left_page/Documents_Types_Container/Documentation/Fossil_energies_&_Renewable_energies/Renewable_energies"
@onready var solar_panels: Panel = $"Panel/Left_page/Documents_Types_Container/Documentation/Fossil_energies_&_Renewable_energies/Solar_panels"
@onready var wind_turbine: Panel = $"Panel/Left_page/Documents_Types_Container/Documentation/Fossil_energies_&_Renewable_energies/Wind_turbine"
@onready var fossil_fuels_vs_renewable_energies: Panel = $"Panel/Left_page/Documents_Types_Container/Documentation/Fossil_energies_&_Renewable_energies/Fossil_fuels_VS_Renewable_energies"
@onready var air_quality_measurement: Panel = $Panel/Left_page/Documents_Types_Container/Documentation/Greenhouse_gases/Air_quality_measurement
@onready var greenhouse_effect: Panel = $Panel/Left_page/Documents_Types_Container/Documentation/Greenhouse_gases/Greenhouse_Effect
@onready var beach_waste_collection: Panel = $"Panel/Left_page/Documents_Types_Container/Documentation/Recycling Materials/Beach_waste_collection"
@onready var plastic_recycling: Panel = $"Panel/Left_page/Documents_Types_Container/Documentation/Recycling Materials/Plastic_recycling"
@onready var recycling_vegetative_waste: Panel = $"Panel/Left_page/Documents_Types_Container/Documentation/Recycling Materials/Recycling_Vegetative_Waste"

@onready var documentation_panel : Array = [
	climate_change, forest_fires, coal, 
	fossil_fuels, renewable_energies, solar_panels,
	wind_turbine, fossil_fuels_vs_renewable_energies, air_quality_measurement,
	greenhouse_effect, beach_waste_collection, plastic_recycling,
	recycling_vegetative_waste]

var current_doc_available = []

func _process(_delta):
	if AllDictionary.documentation_available != current_doc_available:
		doc_adder.play_animation()
		current_doc_available = AllDictionary.documentation_available

func set_documentation(documentation : Documentation_Resource):
	title_label.text = documentation.Documentation_name
	rich_text_label.text = documentation.Documentation_explanation
	source_label.text = documentation.Documentation_source_to_text()

func show_documentation_doc_menu():
	print(documentation_panel)
	for i in range(len(documentation_panel)):
		documentation_panel[i].show_documentation()

func OpenDoc():
	Variable.DocumentaryMenuOpen = !Variable.DocumentaryMenuOpen
	show_documentation_doc_menu()
	$".".show()
	Variable.movelock = true
	Variable.cameralock = true


func CloseDoc():
	Variable.DocumentaryMenuOpen = !Variable.DocumentaryMenuOpen
	$".".hide()
	Variable.movelock = false
	Variable.cameralock = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
