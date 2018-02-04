extends Area2D

signal Collided
signal NotCollided



func _on_PlatformerA_body_entered(body):
	Movement.Collided()


func _on_PlatformerA_body_exited(body):
	Movement.NotCollided()
