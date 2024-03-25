extends Control

var score = 0



func _ready():
	
	GlobalSignal.connect("score", self, "_score")
	$Label.text = "my_score: "+str(score)
	
	

func _score():
	score += 1
	$Label.text = "my_score: "+str(score)




















