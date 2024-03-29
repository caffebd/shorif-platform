extends KinematicBody2D

var FLY_SPEED = 200
var GRAVITY = 500
var FLY_ACCELERATION = 1000
export var speed = 250

export var jump_speed = -450
var gravity = 900

var direction := Vector2.ZERO

var velocity = Vector2()


# Called when the node enters the scene tree for the first time

func _input(event):
	
	direction.x = 0
	
	if Input.is_action_pressed("right"):
		direction.x += speed
		$PlayerAnim.flip_h = false


	if Input.is_action_pressed("left"):
		direction.x -= speed
		$PlayerAnim.flip_h = true

#	NEED MOVE LEFT CODE

func _process(delta):
	
	direction.y += gravity * delta
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			direction.y = jump_speed	

	direction = move_and_slide(direction,  Vector2.UP)

func _physics_process(delta):
	if not Input.is_action_pressed("fly"):
		velocity.y += GRAVITY * delta






