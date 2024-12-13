extends Control

@onready var canvas_layer: CanvasLayer = $CanvasLayer

func _process(_delta):
	if Input.is_action_just_pressed("documentary"):
		canvas_layer.visible = !canvas_layer.visible
	if Input.is_action_just_pressed("escape"):
		if Variable.DocumentaryMenuOpen:
			canvas_layer.visible = true

func Player_uiVisible():
	Variable.player_uiVisible = true
	$CanvasLayer.show()
	print("Player Ui Visible")

func Player_uiInvisible():
	Variable.player_uiVisible = false
	$CanvasLayer.hide()
	print("Player Ui Invisible")
