extends Node2D

class_name Ground

@export var speed = -120

@onready var sprite1 = $Ground1/Sprite2D
@onready var sprite2 = $Ground2/Sprite2D

func _ready():
	sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()
	
#Scroll the sprites endlessly
func _process(delta):
	sprite1.global_position.x += speed * delta
	sprite2.global_position.x += speed * delta
	
	#if sprite1 has fully left the screen move it to the right of the screen
	if sprite1.global_position.x < -sprite1.texture.get_width():
		sprite1.global_position.x = sprite2.global_position.x + sprite2.texture.get_width()
		
	##if sprite2 has fully left the screen move it to the right of the screen
	if sprite2.global_position.x < -sprite2.texture.get_width():
		sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()
