extends Area2D






func _on_egg_body_entered(body):
	GlobalSignal.emit_signal("score")
	queue_free()






