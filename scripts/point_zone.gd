extends Area2D

@onready var player_1 = %player1
@onready var timer = $Timer


func _on_body_entered(body):
	if position.x > 0:
		game_manager.add_point(1)
		timer.start()
	else:
		game_manager.add_point(2)
		timer.start()



func _on_timer_timeout():
	get_tree().reload_current_scene()
