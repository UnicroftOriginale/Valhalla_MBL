extends Camera2D

#var X
#var Y
#var Z
#var O 
#var A
#var B


#func _process(delta):
#	O = get_node("/root/Main/CenterPos").global_position
#	X = get_node("/root/Main/BodyA/Pos").global_position
#	Y = get_node("/root/Main/BodyB/Pos").global_position
#	print(O)
#	#var FX = float(X)
#	#var FY = float(Y)
#	A = (abs((O.x - X.x) - (O.x - Y.x)))
#	B = (abs(X.y - Y.y))
#	#var OA = O - A
#	#var OB = O - B
#	#Z = A + B
#	self.zoom = Vector2(A, 1)
