extends KinematicBody2D

const MOTION_SPEED = 3
const MAX_SPEED = MOTION_SPEED * 2

var Speed = 2
#slave var slave_pos = Vector2()
#slave var slave_motion = Vector2()

var JumpSpeed = 2
var AntiForce = 0
var Gravity = 0.2
var Jump = 0
var Collided


#var Equipped = false
#var A = false
#var Released = false


func _input(event):
	if (event.is_action_pressed("ui_up")) && Jump < 3:
		AntiForce += -JumpSpeed
		Jump += 1
#	if (event.is_action_pressed("UnEquip")) && Equipped:
#		Equipped = false
#		A = false
#		Released = true
#		Combat.UpdateWeaponState()


func _physics_process(delta):
#	Combat.Equipped = Equipped
#	Combat.A = A
#	Combat.Released = Released
		
		
	if AntiForce < 1 :
		AntiForce += Gravity
		
	var motion = Vector2()
#	if (is_network_master()):
	if (Input.is_action_pressed("ui_left")):
		#set_scale(Vector2(1, 1))
		motion.x -= 1
	if (Input.is_action_pressed("ui_right")):
		motion.x += 1
		#set_scale(Vector2(-1, 1))
		
	motion.y = AntiForce
	if motion.length() > 0:
		motion = motion * MOTION_SPEED
		
		
#		rset("slave_motion", motion)
##		rset("slave_pos", position)
#	else:
#		position=slave_pos
#		motion = slave_motion
	# FIXME: Use move_and_slide
	Collided = move_and_collide(motion)
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
	
