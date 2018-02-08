extends Node

var Legend = Movement.LegendChosen

func _ready():
	var Ins = Movement.Legend.instance()
	$Players.add_child(Ins)
	Movement.GameStarted = true
