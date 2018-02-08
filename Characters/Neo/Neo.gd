extends KinematicBody2D
	
var null = null 
#slave var slave_pos = Vector2()
#slave var slave_motion = Vector2()


var MyPlayerNum

var Motion

var Collided
#var Equipped = false
#var A = false
#var Released = false
###null is AWESOME 


#	if (event.is_action_pressed("ui_up")) && Jump < 3:
#		AntiForce += -JumpSpeed
#		Jump += 1
#	if (event.is_action_pressed("UnEquip")) && Equipped:
#		Equipped = false
#		A = false
#		Released = true
#		Combat.UpdateWeaponState()
func _ready():
	MyPlayerNum = Movement.PlayerNum
	Motion = Vector2()
#	if MyPlayerNum == 1:
#		Motion = Movement.MotionA
#	elif MyPlayerNum == 2:
#		Motion = Movement.MotionB


func _process(delta):
		if MyPlayerNum == 1:
			Motion.x = Movement.MotionAX
			Motion.y = Movement.MotionAY
		elif MyPlayerNum == 2:
			Motion.x = Movement.MotionBX
			Motion.y = Movement.MotionBY
			
		if Motion.length() > 0:
			Motion = Motion * delta
			
		Collided = move_and_collide(Motion)
		if Collided:
			Movement.OnCollision()
		else:
			Movement.OnCollisionExit()
		
	#motion.y = AntiForce
		
		
#		rset("slave_motion", motion)
##		rset("slave_pos", position)
#	else:
#		position=slave_pos
#		motion = slave_motion
	# FIXME: Use move_and_slide
#	if (not is_network_master()):
#		slave_pos = position # To avoid jitter


#func set_player_name(new_name):
#	get_node("label").set_text(new_name)

#func _ready():
#	slave_pos = position
	