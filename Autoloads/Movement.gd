extends Node

var Velocity = Vector2()
var Movement
var AntiForce = 0
var Gravity = 0.2
var Jump = true

export var Force = 1
export var Speed = 2
	
	
func MoveRight():
	Velocity.x = Force
func MoveLeft():
	Velocity.x = -Force
func MoveZero():
	Velocity = Vector2(0, 0)
func Jump():
	AntiForce += -Speed / 2
func GravityZero():
	Gravity = 0
	
func _process(delta):

	if AntiForce < Speed / 2:
		AntiForce += Gravity
		
		
	Velocity.y = AntiForce
	
	Movement = Velocity * (delta + Speed)
	
	
