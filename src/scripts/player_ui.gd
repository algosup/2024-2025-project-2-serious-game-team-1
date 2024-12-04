extends Control

@onready var location_label: Label = %Location_Label
@onready var progress_bar: ProgressBar = $CanvasLayer/ProgressBar

func _process(_delta):
	location_label.text = str(Zones.zone_name)
	progress_bar.value = EcoFollow.eco_town

func Player_uiVisible():
	Variable.player_uiVisible = true
	$CanvasLayer.show()
	print("Player Ui Visible")

func Player_uiInvisible():
	Variable.player_uiVisible = false
	$CanvasLayer.hide()
	print("Player Ui Invisible")
