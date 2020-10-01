extends KinematicBody2D

var default_weight = 0.0
var carried_weight = 0.0

func get_weight():
	return carried_weight

func move_up():
	move_and_collide(Vector2(0, -1))


func move_down():
	move_and_collide(Vector2(0, 1))


func _on_Area2D_body_entered(body):
	if body.is_in_group("with weight"):
		carried_weight += body.get_weight()

func _on_Area2D_body_exited(body):
	if body.is_in_group("with weight"):
		carried_weight -= body.get_weight()

