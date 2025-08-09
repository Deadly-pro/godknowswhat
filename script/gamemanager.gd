extends Node
var score = 0
@onready var points=$points

func add_point():
	score+=1
	points.text="you collected "+str(score)+" coins."
	
