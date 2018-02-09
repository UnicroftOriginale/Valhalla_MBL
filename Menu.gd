extends Control

var PlayerNum


func _on_OnlineGame_pressed():
	$Error.popup()


func _on_OfflineGame_pressed():
	$Main.hide()
	$CharacterSelect.show()


func _on_Options_pressed():
	$Error.popup()


func _on_neoA_pressed():
	PlayerNum = $Main/PlayerCount.text.to_int()
	Movement.LegendChosen = "Neo"
	Movement.PlayerNum = PlayerNum
	Movement.ConfigureGame()



func _on_neoB_pressed():
	PlayerNum = $Main/PlayerCount.text.to_int()
	Movement.LegendChosen = "Neo"
	Movement.PlayerNum = PlayerNum
	Movement.ConfigureGame()


func _on_neoC_pressed():
	PlayerNum = $Main/PlayerCount.text.to_int()
	Movement.LegendChosen = "Nmk"
	Movement.PlayerNum = PlayerNum
	Movement.ConfigureGame()


func _on_Back_pressed():
	$CharacterSelect.hide()
	$Main.show()
	
	

