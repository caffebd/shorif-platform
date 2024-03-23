extends Area2D



var score = 1


func _on_egg_body_entered(body):
	GlobalSignal.emit_singal("score",score)
	queue_free()







