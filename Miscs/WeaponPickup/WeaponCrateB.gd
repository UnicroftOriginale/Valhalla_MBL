extends Area2D

var InsideBox = false

func _ready():
	set_process(true)
	
func _process(delta):
	if Input.is_action_pressed("Equip") && InsideBox:
		if has_node("/root/Main/Players/Player"):
			get_node("/root/Main/Players/Player/Player/Inventory/NeoWeaponA").set_hidden(true)
			get_node("/root/Main/Players/Player/Player/Inventory/NeoWeaponB").set_hidden(false)
			queue_free()

func _on_WeaponCrateB_body_enter(Body):
	if Body.is_in_group("Player"):
		InsideBox = true
		

