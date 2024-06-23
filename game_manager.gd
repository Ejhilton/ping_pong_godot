extends Node

var p1_score = 0
var p2_score = 0

func add_point(player):
	if player == 1:
		p1_score += 1
	else:
		p2_score += 1
