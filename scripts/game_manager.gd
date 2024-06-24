extends Node

@onready var score_label = $ScoreLabel
@onready var score_label_2 = $ScoreLabel2
@onready var player_1 = %player1
@onready var player_2 = %player2
@onready var ball = %ball


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


func reset():
	player_1.position = global_settings.p1_start_position
	player_2.position = global_settings.p2_start_position
	ball.position = global_settings.ball_start_position
