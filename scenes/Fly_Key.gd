extends Area2D



func _on_Player_body_entered(body):
	if body.has_method("eat"):
		body.eat()
	queue_free() 

