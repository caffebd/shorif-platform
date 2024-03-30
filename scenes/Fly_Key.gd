extends Area2D





func _on_Fly_Key_body_entered(body):
	if body.is_in_group("player"):
<<<<<<< HEAD
		GlobalSignal.emit_signal("key")
=======
		GlobalSignal.emit_signal("Key")
>>>>>>> fcc2a7766bd5537e820cf95bdb21d2b551a26246
		queue_free()
