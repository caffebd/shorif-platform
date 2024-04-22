extends Control

var score = 0

var fly_timer = 5

var gmae_timer = 60

func _ready():
	$Timer.start()
	GlobalSignal.connect("score", self, "_score")
	GlobalSignal.connect("Key", self, "_Key")
	$Label.text = "my_score: "+str(score)
	GlobalSignal.connect("show_sign", self, "_show_sign")
	GlobalSignal.connect("hide_sign", self, "_hide_sign")


func _show_sign(text):
	$RichTextLabel.text = text
	$RichTextLabel.visible = true



func _hide_sign():
	$RichTextLabel.visible = false









func _Key():
	fly_timer = 5
	$Fly.text = "Fly :"+str(fly_timer)
	$Fly_TImer.start()
	
	
	
func _score():
	score += 1
	$Label.text = "my_score: "+str(score)
	



func _on_Timer_timeout():
	gmae_timer -= 1
	$Label2.text = "Timer :"+str(gmae_timer)




func _on_Fly_TImer_timeout():
	fly_timer -= 1
	$Fly.text = "Fly :"+str(fly_timer)
	if fly_timer == 0:
		$Fly_TImer.stop()
		GlobalSignal.emit_signal("stop_Fly")
