extends Control


func Player_uiVisible():
	Variable.player_uiVisible = true
	$CanvasLayer.show()
	print("Player Ui Visible")

func Player_uiInvisible():
	Variable.player_uiVisible = false
	$CanvasLayer.hide()
	print("Player Ui Invisible")
