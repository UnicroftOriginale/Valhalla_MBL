extends Node


var Character = Movement.LegendChosen

var Pos
var WeaponA
var WeaponB
var PlayerWA
var PlayerWB

var Equipped = false
var A = false
var Released = false

var Player 


func UpdateWeaponState():
		if Equipped && A:
			WeaponA = load("res://Characters/Nmk/EquippedA.tscn")
			Pos = get_node("/root/Main/Players/Nmk").global_position
			get_node("/root/Main/Players/Nmk").queue_free()
			PlayerWA = WeaponA.instance()
			PlayerWA.global_position = Pos
			get_node("/root/Main/Players").add_child(PlayerWA)
		elif Equipped:
			WeaponB = load("res://Characters/" + Character + "/EquippedB.tscn")
			Pos = $root/Main/Players/Player.get_global_pos()
			$root/Main/Players/Player.queue_free()
			PlayerWB = (WeaponB.instance()).set_pos(Pos)
			$root/Main/Players.add_child(PlayerWB)
		elif Released:
			if has_node("/root/Main/Players/PlayerWA"):
				Player = load("res://Characters/" + Character + "/Character.tscn")
				$root/Main/Players/PlayerWA.queue_free()
				Player.instance()
				$root/Main/Players.add_child(Player)
				Released = false
			elif has_node("/root/Main/Players/PlayerWB"):
				Player = load("res://Characters/" + Character + "/Character.tscn")
				$root/Main/Players/PlayerWB.queue_free()
				Player.instance()
				$root/Main/Players.add_child(Player)
				Released = false
			else:
				Released = false
				print("DEBUG:Release Weapon Run/No Weapon Found!")
		else:
			print("Didnt grab any weapons")
			
			
		
		