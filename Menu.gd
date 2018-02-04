extends Control


func _ready():
	var But = $Main/EasterBunny


func _on_OnlineGame_pressed():
	$Error.popup()


func _on_OfflineGame_pressed():
	$Main.hide()
	$CharacterSelect.show()


func _on_EasterBunny_pressed():
	$Main.hide()
	$EasturIg.show()


func _on_Options_pressed():
	$Error.popup()


func _on_neoA_pressed():
	Movement.LegendChosen = "Neo"
	Movement.ConfigureGame()



func _on_neoB_pressed():
	Movement.LegendChosen = "Neo"
	Movement.ConfigureGame()


func _on_neoC_pressed():
	Movement.LegendChosen = "Neo"
	Movement.EA = true
	Movement.ConfigureGame()


func _on_Back_pressed():
	$CharacterSelect.hide()
	$Main.show()
	


func _on_Select_pressed():
	$Main/EasterBunny.queue_free()
	Movement.NMK = true
	$EasturIg.hide()
	$Main.show()
