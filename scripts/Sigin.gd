extends Area2D

export var sign_text = ""



func _on_sign_body_entered(body):
	if body.is_in_group("player"):
		GlobalSignal.emit_signal("show_sign", sign_text)
		
		



func _on_sign_body_exited(body):
	if body.is_in_group("player"):
		GlobalSignal.emit_signal("hide_sign")
