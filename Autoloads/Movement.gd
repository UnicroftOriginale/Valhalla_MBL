extends Node
	
var LegendChosen
var EA = false
var NMK = false
	


func ConfigureGame():
	if EA && NMK:
		LegendChosen = "Nmk"
	var Legend = load("res://Characters/" + LegendChosen + "/Character.tscn")
	get_tree().change_scene("res://Main.tscn")
	var Ins = Legend.instance()
	add_child(Ins)