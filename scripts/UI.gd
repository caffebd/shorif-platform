extends Control

var score = 1


func _ready():
	GlobalSignal.connect("score", self, "_score")
	

func _score():
	score += 1
	$Player.text = "my_score: "+str("my_score")






















