extends Node

var Velocity = Vector2()
var Movement

export var Force = 1
export var Speed = 2

func MoveRight():
	Velocity.x = Force
func MoveLeft():
	Velocity.x = -Force
func MoveZero():
	Velocity = Vector2(0, 0)
func Jump():
	pass
	
func _process(delta):
	Movement = Velocity * (delta + Speed)
