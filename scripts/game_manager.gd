extends Node

@onready var score_label = $ScoreLabel
@onready var score_label_2 = $ScoreLabel2
	
func _ready():
	score_label.text = "Player 1 Score: " + str(global_settings.p1_score)
	score_label_2.text = "Player 2 Score: " + str(global_settings.p2_score)
	
func add_point(player):
	if player == 1:
		global_settings.p1_score += 1
		score_label.text = "Player 1 Score: " + str(global_settings.p1_score)
	else:
		global_settings.p2_score += 1
		score_label_2.text = "Player 2 Score: " + str(global_settings.p2_score)

