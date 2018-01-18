extends KinematicBody2D

var Pos 
var Vel = 2

func _ready():
	set_process(true)
	
func _process(delta):
	Pos = get_pos()
	if Input.is_action_pressed("Test1"):
		Pos.x += -Vel

