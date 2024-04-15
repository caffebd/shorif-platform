extends KinematicBody2D

var FLY_SPEED = 200



var FLY_ACCELERATION = 1000
export var speed = 200
var canFly = false


var velocity = Vector2()
export var jump_speed = -450


var gravity = 500

var flying = false

#export var jump_speed = -450
#var gravity = 900

var direction := Vector2.ZERO
var pushed = false

func _ready():
	GlobalSignal.connect("Key", self, "_key")
	GlobalSignal.connect("stop_Fly", self, "_stop_Fly")
	GlobalSignal.connect("push_up", self, "_push_up")
		
func _push_up():
	pushed = true
		

		
func _key():
	gravity = 0
	flying = true


func _stop_Fly():
	gravity = 900
	flying = false



func _input(event):
	
	direction.x = 0
	
	
	
	if Input.is_action_pressed("right"):
		direction.x += speed
		$PlayerAnim.flip_h = false


	if Input.is_action_pressed("left"):
		direction.x -= speed
		$PlayerAnim.flip_h = true

	
	if flying:
		direction.y = 0 

		if Input.is_action_pressed("jump"):
			direction.y -= speed

		if Input.is_action_pressed("Down"):
			direction.y += speed




func _process(delta):
	
	direction.y += gravity * delta
	if Input.is_action_just_pressed("jump"):
		if is_on_floor() and not flying:
			direction.y = jump_speed

	if pushed:
		direction.y = jump_speed/2
		pushed = false

	direction = move_and_slide(direction,  Vector2.UP)






