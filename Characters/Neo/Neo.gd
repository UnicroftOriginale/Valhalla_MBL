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
	##Weapon Mechanics
	if WeaponACanEquip && Input.is_action_pressed("Equip"): ##Equip = "E"
		if WeaponBEquipped: #Checking if another weapon is already equipped and making it invincible
			get_node("Inventory/CursedBlade").set_hidden(true)
			get_node("Inventory/Blasters").set_hidden(false)
			WeaponBEquipped = false
			WeaponAEquipped = true
		else:
			get_node("Inventory/Blasters").set_hidden(false)
			WeaponAEquipped = true
		
	if WeaponBCanEquip && Input.is_action_pressed("Equip"):
		if WeaponAEquipped:
			get_node("Inventory/Blasters").set_hidden(true)
			get_node("Inventory/CursedBlade").set_hidden(false)
			WeaponAEquipped = false
			WeaponBEquipped = true
		else:
			get_node("Inventory/CursedBlade").set_hidden(false)
			WeaponBEquipped = true
			
	if (WeaponAEquipped or WeaponBEquipped) && Input.is_action_pressed("UnEquip"):##UnEquip = "Q"
		get_node("Inventory/Blasters").set_hidden(true)
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
		if get_collider().is_in_group("WeaponCrateA"):
			WeaponACanEquip = true
			JumpAntiForce = 0 ##TEMPORARY
			Gravity = 0 ##TEMPORARY
		else:
			WeaponACanEquip = false
		if get_collider().is_in_group("WeaponCrateB"):###fwew
			WeaponBCanEquip = true
			JumpAntiForce = 0 ##TEMPORARY
			Gravity = 0 ##TEMPORARY
		else:
			WeaponBCanEquip = false
	else:
		Gravity = 0.2  ##Doing the same thing as in the NonWalkable group but ehh
		
	#Applying movement
	Movement = Velocity * (delta + EndSpeed)
	move(Movement)
