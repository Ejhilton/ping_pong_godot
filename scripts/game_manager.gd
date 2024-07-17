extends Node

@onready var in_game_ui = $in_game_ui
@onready var score_label = $in_game_ui/%ScoreLabel
@onready var score_label_2 = $in_game_ui/%ScoreLabel2
@onready var player_1 = %player1
@onready var player_2 = %player2
@onready var ball = %ball
@onready var ball_trail = $"../ball_trail"


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
	var new_game = preload("res://scenes/main_game.tscn").instantiate()
	get_tree().root.add_child(new_game)
	get_parent().queue_free()
	
	
	
	
	

# Flag to track the pause state
var is_paused = false

func _input(event):
	# Toggle the pause state when the "Pause" key is pressed
	if event.is_action_pressed("pause"):
		toggle_pause()

func toggle_pause():
	is_paused = !is_paused
	get_tree().paused = is_paused
	# You can add additional logic here, such as displaying a pause menu

func pause():
	is_paused = true
	get_tree().paused = true

func unpause():
	is_paused = false
	get_tree().paused = false
