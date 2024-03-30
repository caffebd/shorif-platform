extends KinematicBody2D

var FLY_SPEED = 200
<<<<<<< HEAD
var gravity  = 500
=======
>>>>>>> fcc2a7766bd5537e820cf95bdb21d2b551a26246
var FLY_ACCELERATION = 1000
export var speed = 250
var canFly = false


var velocity = Vector2()
export var jump_speed = -450


var gravity = 900



<<<<<<< HEAD
func _physics_process(delta):
	velocity.y += gravity * delta


	move_and_slide(velocity)



#export var jump_speed = -450
#var gravity = 900

var direction := Vector2.ZERO

func _key():
	GlobalSignal.connect("key", self, "key")
=======

export var jump_speed = -450

var gravity = 900

var direction := Vector2.ZERO

func _ready():
	GlobalSignal.connect("Key", self, "_key")

func _key():
	gravity = 0
>>>>>>> fcc2a7766bd5537e820cf95bdb21d2b551a26246

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


<<<<<<< HEAD
func _key():
	gravity = 0
=======



>>>>>>> fcc2a7766bd5537e820cf95bdb21d2b551a26246



