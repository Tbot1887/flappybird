extends Node2D

class_name PipeSpawner

var pipe_pair_scene = preload("res://Scenes/pipe_pair.tscn")

@export var pipe_speed = -120

@onready var spawn_timer = $SpawnTimer

func _ready():
	spawn_timer.timeout.connect(spawn_pipe)

func spawn_pipe():
	pass
