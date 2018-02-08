extends Node
	
#### AFPRIS 0.1 ###################(A FutureProof Request Input System)###########
	
var Legend
var LegendChosen
var PlayerNum
var EA = false
var NMK = false
var GameStarted = false

var MotionSpeed = 60

var JumpSpeed = 5
var Gravity = 0.2
var InitGravity = Gravity


var MotionA
var MotionAX
var MotionAY
var AntiForceA = 0
var JumpA = 0

var MotionB
var MotionBX
var MotionBY
var AntiForceB = 0
var JumpB = 0


func _ready():
	MotionA = Vector2()
	MotionB = Vector2()


func _process(delta):
			
	if PlayerNum == 1:
		if AntiForceA < 1:
			AntiForceA += Gravity
		if GameStarted:
			if Input.is_action_pressed("ui_right"):
				MotionA += Vector2(1, 0)
			elif Input.is_action_pressed("ui_left"):
				MotionA += Vector2(-1, 0)
			else:
				MotionA = Vector2(0, 0)
		MotionA.y = AntiForceA
		MotionAX = MotionA.x * MotionSpeed
		MotionAY = MotionA.y * MotionSpeed
	elif PlayerNum == 2:
		if AntiForceB < 1:
			AntiForceB += Gravity
		if GameStarted:
			if Input.is_action_pressed("ui_right"):
				MotionB += Vector2(1, 0)
			elif Input.is_action_pressed("ui_left"):
				MotionB += Vector2(-1, 0)
			else:
				MotionB = Vector2(0, 0)
		MotionB.y = AntiForceB
		MotionBX = MotionB.x * MotionSpeed
		MotionBY = MotionB.y * MotionSpeed
		


func _input(event):
	if event.is_action_pressed("ui_up"):
		if PlayerNum == 1 && JumpA < 3:
			AntiForceA += -JumpSpeed
			JumpA += 1
		elif PlayerNum == 2 && JumpB < 3:
			AntiForceB += -JumpSpeed
			JumpB += 1


func ConfigureGame():
	if EA && NMK:
		LegendChosen = "Nmk"
	Legend = load("res://Characters/" + LegendChosen + "/Character.tscn")
	get_tree().change_scene("res://Main.tscn")


func OnCollision():
	Gravity = 0
	if PlayerNum == 1:
		JumpA = 0
	elif PlayerNum == 2:
		JumpB = 0


func OnCollisionExit():
	Gravity = InitGravity

