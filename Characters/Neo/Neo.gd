extends KinematicBody2D

var CharacterName = "Neo"

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		Movement.MoveRight()
	elif Input.is_action_pressed("ui_left"):
		Movement.MoveLeft()
	else:
		Movement.MoveZero()
	if Input.is_action_pressed("ui_up"):
		Movement.Jump()
		
		
		
	move_and_collide(Movement.Movement)
