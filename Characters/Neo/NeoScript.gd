extends KinematicBody2D

#Essential Variables
var Velocity = Vector2()
var Move 

#Character Specific Variables
export var Speed = 3


func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	if Input.is_action_pressed("MoveRight") && !Moved:
		Velocity = Vector2(1, 0)
		Moved = true
	elif Input.is_action_pressed("MoveLeft") && !Moved:
		Velocity = Vector2(-1, 0)
		Moved = true
	else:
		Velocity = Vector2(0, 0)
		
	
	Move = Velocity * (delta + Speed)
	move(Move)
	

#func _on_PlayerTimer_timeout():
#	pass
