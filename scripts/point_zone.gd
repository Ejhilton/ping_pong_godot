extends Area2D

@onready var player_1 = %player1
@onready var player_2 = %player2

@onready var timer = $Timer
@onready var game_manager = %GameManager
@onready var point_sound = $point_sound

func _on_body_entered(body):
	point_sound.play()
	if position.x > 0:
		game_manager.add_point(1)
	else:
		game_manager.add_point(2)
	timer.start()



func _on_timer_timeout():
	game_manager.reset()
