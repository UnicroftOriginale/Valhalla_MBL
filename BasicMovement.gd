extends KinematicBody2D

var motion 
var Speed = 150


func _process(delta):
	motion = Vector2()
	if Input.is_action_pressed("move_right"):
		motion.x += 1
	elif Input.is_action_pressed("move_left"):
		motion.x -= 1
		
	var move = motion * delta * Speed
	move_and_collide(move)
		
