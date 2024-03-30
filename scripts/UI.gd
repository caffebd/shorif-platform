extends Control

var score = 0

var Timer = 10

func _ready():
	$Timer.start()
	GlobalSignal.connect("score", self, "_score")
	GlobalSignal.connect("Key", self, "_Key")
	$Label.text = "my_score: "+str(score)



func _Key():
	score += 1
	$Label.text = "newschore: "+str(score)
	
	
	
func _score():
	score += 1
	$Label.text = "my_score: "+str(score)



func _on_Timer_timeout():
	Timer -= 1
	$Label2.text = "Timer :"+str(Timer)





