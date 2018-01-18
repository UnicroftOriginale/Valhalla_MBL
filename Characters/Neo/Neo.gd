extends KinematicBody2D

###Essential Variables
var Velocity = Vector2()
var Movement
var Jump = true
var Offset
var RelativeMousePos
var WeaponACanEquip = false
var WeaponBCanEquip = false
var WeaponAEquipped = false
var WeaponBEquipped = false


###Character Specific Variables
var Speed = 1
var EndSpeed = 3
var Gravity = 0.2
var JumpAntiForce = 0

func _ready():
	set_fixed_process(true)
	

	
	
func _fixed_process(delta):
	#If no other force applied gravity pushes
	if JumpAntiForce < Speed * 3:
		JumpAntiForce += Gravity
		
	##Inputsz
	if Input.is_action_pressed("ui_up") && Jump:
		JumpAntiForce = -Speed * 3
		Jump = false
	if Input.is_action_pressed("ui_right"):
		Velocity.x = Speed
		set_scale(Vector2(1, 1))
	elif Input.is_action_pressed("ui_left"):
		Velocity.x = -Speed
		set_scale(Vector2(-1, 1))
	else:
		Velocity = Vector2(0, 0)
	Velocity.y = JumpAntiForce
	
	if is_colliding():
		if get_collider().is_in_group("Walkable"): #Checking the type(group) of collision 
			JumpAntiForce = 0
			Gravity = 0
			Jump = true
		if get_collider().is_in_group("NonWalkable"):
			Gravity = 0.2
		if get_collider().is_in_group("Destroyer"):
			get_node("/root/Main/UI/PopupPanel").popup()
			queue_free()
	else:
		Gravity = 0.2  ##Doing the same thing as in the NonWalkable group but ehh
		
	#Applying movement
	Movement = Velocity * (delta + EndSpeed)
	move(Movement)
