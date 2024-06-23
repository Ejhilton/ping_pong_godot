extends Area2D

@onready var game_manager = %GameManager
@onready var player_1 = %player1
@onready var timer = $Timer


func _on_body_entered(body):
	if body == %player1:
		game_manager.add_point(1)
		timer.start()
	else:
		game_manager.add_point(2)
		timer.start()



func _on_timer_timeout():
	get_tree().reload_current_scene()
