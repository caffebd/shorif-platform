extends Timer


func _ready():
	Timer.start()

func _on_Timer_timeout():
	print("Time's up!")
