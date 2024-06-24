extends Area2D

@onready var player_1 = %player1
@onready var player_2 = %player2

@onready var timer = $Timer
@onready var game_manager = %GameManager
var new_game = preload("res://scenes/main_game.tscn")

func _on_body_entered(body):
	if position.x > 0:
		game_manager.add_point(1)
	else:
		game_manager.add_point(2)
	timer.start()



func _on_timer_timeout():
	game_manager.reset()
