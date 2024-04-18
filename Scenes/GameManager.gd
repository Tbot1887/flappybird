extends Node

@onready var bird = $"../Bird" as Bird
@onready var pipe_spawner = $"../PipeSpawner" as PipeSpawner
@onready var ground = $"../Ground" as Ground
@onready var fade = $"../Fade" as Fade


var points = 0

func _ready():
	bird.game_started.connect(on_game_started)
	ground.bird_crashed.connect(on_end_game)
	pipe_spawner.bird_crashed.connect(on_end_game)
	pipe_spawner.point_awarded.connect(on_point_awarded)
	
func on_game_started():
	pipe_spawner.start_spawning_pipes()

func on_end_game():
	if fade != null:
		fade.play()
	ground.stop()
	bird.kill()
	pipe_spawner.stop()

func on_point_awarded():
	points += 1
