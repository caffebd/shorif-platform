extends KinematicBody2D

const GRAVITY = 900

var walk_speed = 100

var direction = Vector2.ZERO





export var walk_timer = 3


func _process(delta):
	direction.y += GRAVITY * delta
	
	if is_on_floor():
		direction.x = walk_speed
		
	direction = move_and_slide(direction, Vector2.UP)\

func _ready():
	$WalkTimer.wait_time = walk_timer




func _on_WalkTimer_timeout():
	walk_speed *= -1


func _on_KillArea2D_body_entered(body):
	if body.is_in_group("player"):
		get_tree().reload_current_scene()


func _on_DieArea2D2_body_entered(body):
	if body.is_in_group("player"):
		GlobalSignal.emit_signal("push_up")
		queue_free()





func _on_DieArea2D2_area_entered(area):
	if area.is_in_group("ufo"):
		GlobalSignal.emit_signal("ufo_reurn")
		queue_free()
