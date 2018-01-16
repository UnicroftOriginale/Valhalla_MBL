extends KinematicBody2D

###Essential Variables
var Velocity = Vector2()
var Movement
var Jump = true
var Offset
var RelativeMousePos

###Character Specific Variables
var Speed = 1
var EndSpeed = 3
var Gravity = 0.2
var hid = true
var JumpAntiForce = 0


func _ready():
	set_fixed_process(true)
	for i in get_tree().get_nodes_in_group("Pickup"):
		connect("PickupWeapon", i, "Pick")

	
	
func _fixed_process(delta):
	##Testing the weapons
	if Input.is_action_pressed("Test1"):
		get_node("Inventory/Blasters").set_hidden(false)
		##Applying the rotation of the blasters in radians
		Offset = -get_viewport().get_canvas_transform().o * get_node("Camera2D").get_zoom() 
		RelativeMousePos = get_viewport().get_mouse_pos() * get_node("Camera2D").get_zoom() + Offset 
		get_node("Inventory/Blasters").look_at(RelativeMousePos)
		#NOT WORKING--Changing scale if on MousePos on -x
		if RelativeMousePos.x == -RelativeMousePos.x:
			set_scale(Vector2(-1, 1))
	else:
		get_node("Inventory/Blasters").set_hidden(true)
		set_scale(Vector2(1, 1))
	if Input.is_action_pressed("Test2"):
		get_node("Inventory/CursedBlade").set_hidden(false)
	else:
		get_node("Inventory/CursedBlade").set_hidden(true)
		
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
	#If colliding gravity is stopped
	if is_colliding():
		JumpAntiForce = 0
		Gravity = -1
		Jump = true
		#get_node("Inventory/Blasters").set_hidden(false)
	else:
		#get_node("Inventory/Blasters").set_hidden(true)
		Gravity = 0.2
		
	#Applying movement
	Movement = Velocity * (delta + EndSpeed)
	move(Movement)

func _on_Area2D_area_enter(Area2D):
	get_node("Inventory/Blasters").set_hidden(false)
