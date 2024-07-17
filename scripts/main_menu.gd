extends Control

var scene = preload("res://scenes/main_game.tscn").instantiate()


func _on_play_game_pressed():
	get_tree().root.add_child(scene)
	GameMusic.play()
	get_tree().root.remove_child(self)
	

func _on_exit_pressed():
	GameMusic.stop()
	get_tree().quit()
