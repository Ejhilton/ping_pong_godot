extends Node

var p1_score = 0
var p2_score = 0
@onready var p_1_point_zone = $"../p1_point_zone"
@onready var p_2_point_zone = $"../p2_point_zone"

@onready var ball = $"../ball"

func add_point(player):
	if player == 1:
		p1_score += 1
		print(p1_score)
	else:
		p2_score += 1
		print(p2_score)

