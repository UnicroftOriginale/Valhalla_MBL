extends Area2D

var Health = 20
var AttackB = 10

func _ready():
	set_process(true)
	
	
func _process(delta):
	if Health <= 0:
		queue_free()


func _on_StaticBody2D_area_enter(area):
	if area.is_in_group("WeaponB") && (get_node("/root/Main/Players/Player/Player/Inventory/NeoWeaponB").is_hidden() == false):
		Health = Health - AttackB
	elif area.is_in_group("WeaponA") && (get_node("/root/Main/Players/Player/Player/Inventory/NeoWeaponA").is_hidden() == false):
		Health = Health - AttackB
