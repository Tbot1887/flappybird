extends Node2D

class_name pipe_pair

signal bird_hit
signal point_awarded

var speed = 0

func set_speed(new_speed):
	speed = new_speed
	
func _process(delta):
	position.x = speed * delta
	
func _on_body_entered(body):
	bird_hit.emit()
	
func _on_point_scored(body):
	point_awarded.emit()
