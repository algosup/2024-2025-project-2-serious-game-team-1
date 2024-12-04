extends Control

@onready var location_label: Label = %Location_Label
@onready var progress_bar: ProgressBar = $CanvasLayer/ProgressBar

func _process(_delta):
	location_label.text = str(Zones.zone_name)
	progress_bar.value = EcoFollow.eco_town
	
