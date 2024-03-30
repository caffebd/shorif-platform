extends KinematicBody2D

var FLY_SPEED = 200
var GRAVITY = 500
var FLY_ACCELERATION = 1000
export var speed = 250
var canFly = false


var velocity = Vector2()

func _physics_process(delta):
	velocity.y += GRAVITY * delta


	move_and_slide(velocity)



export var jump_speed = -450
var gravity = 900

var direction := Vector2.ZERO



func _input(event):
	
	direction.x = 0
	
	if Input.is_action_pressed("right"):
		direction.x += speed
		$PlayerAnim.flip_h = false


	if Input.is_action_pressed("left"):
		direction.x -= speed
		$PlayerAnim.flip_h = true



func _process(delta):
	
	direction.y += gravity * delta
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			direction.y = jump_speed	

	direction = move_and_slide(direction,  Vector2.UP)

func _physics_process(delta):
	if not Input.is_action_pressed("fly"):
		velocity.y += gravity * delta






