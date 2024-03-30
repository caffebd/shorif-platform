extends Area2D





func _on_Fly_Key_body_entered(body):
	if body.is_in_group("player"):
		GlobalSignal.emit_signal("Key")
		queue_free()
