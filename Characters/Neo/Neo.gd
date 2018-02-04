extends KinematicBody2D

const MOTION_SPEED = 3
const MAX_SPEED = MOTION_SPEED * 5

var Speed = 5
#slave var slave_pos = Vector2()
#slave var slave_motion = Vector2()

var JumpSpeed = 2.5
var AntiForce = 0
var Gravity = 0.2
var Jump = 0
var Collided


func _input(event):
	if (event.is_action_pressed("ui_up")) && Jump < 3:
		AntiForce += -JumpSpeed
		Jump += 1


func _physics_process(delta):
	if AntiForce < 1 :
		AntiForce += Gravity
	var motion = Vector2()
#	if (is_network_master()):
	if (Input.is_action_pressed("ui_left")):
		motion.x -= 1
	if (Input.is_action_pressed("ui_right")):
		motion.x += 1
		
	motion.y = AntiForce
	if motion.length() > 0:
		motion = motion * MOTION_SPEED
		
		
#		rset("slave_motion", motion)
##		rset("slave_pos", position)
#	else:
#		position=slave_pos
#		motion = slave_motion
	# FIXME: Use move_and_slide
	Collided = move_and_collide(motion * MOTION_SPEED)
	if Collided:
		if Collided.collider.is_in_group("Platform"):
			Jump = 0 
			Gravity = 0
			AntiForce = 0
	else:
		Gravity = 0.2
#	if (not is_network_master()):
#		slave_pos = position # To avoid jitter


#func set_player_name(new_name):
#	get_node("label").set_text(new_name)

#func _ready():
#	slave_pos = position
	
