extends KinematicBody2D

###Essential Variables
var Velocity = Vector2()
var Movement
var Jump = true

###Character Specific Variables
var Speed = 1
var EndSpeed = 3
var Gravity = 0.2
var JumpAntiForce = 0



func _ready():
	set_fixed_process(true)
	
	
	
func _fixed_process(delta):
	if JumpAntiForce < Speed * 3:
		JumpAntiForce += Gravity
	if Input.is_action_pressed("ui_up") && Jump:
		JumpAntiForce = -Speed * 3
		Jump = false
	if Input.is_action_pressed("ui_right"):
		Velocity.x = Speed
		set_scale(Vector2(-1, 1))
	elif Input.is_action_pressed("ui_left"):
		Velocity.x = -Speed
		set_scale(Vector2(1, 1))
	else:
		Velocity = Vector2(0, 0)
	Velocity.y = JumpAntiForce
	if is_colliding():
		JumpAntiForce = 0
		Gravity = 0
		Jump = true
	else:
		Gravity = 0.2
		
		
	Movement = Velocity * (delta + EndSpeed)
	move(Movement)