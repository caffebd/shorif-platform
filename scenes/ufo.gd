extends KinematicBody2D

var enemy

var speed = 160.0
var attack_speed = 250.0

var target_position = Vector2.ZERO

var attacking = false

export(NodePath) var enemies_path
onready var enemies = get_node(enemies_path)

export(NodePath) var player_path
onready var player = get_node(player_path)


func _ready():
	GlobalSignal.connect("ufo_attack", self, "_ufo_attack")
	GlobalSignal.connect("ufo_return", self, "_ufo_return")

func _ufo_attack():
	if attacking:
		return
		
	
	
	var all_enemys = enemies.get_children()

	if all_enemys.size() > 0:
		var target_enemy = all_enemys[0]
		
		for check_enemy in all_enemys:

			var distance = position.distance_to(check_enemy.position)

			if distance < position.distance_to(target_enemy.position):
				target_enemy = check_enemy

		enemy = target_enemy


		if position.distance_to(enemy.position) < 500:
			attacking = true
			
			
func _ufo_return():
	attacking = false

func _process(delta):

	if attacking:

		target_position = (enemy.position - position).normalized()

		move_and_slide(target_position * attack_speed, Vector2.UP)

	else:

		var player_pos = Vector2(player.position.x, player.position.y-10)

		target_position = (player_pos - position).normalized()

		if position.distance_to(player_pos) > 40:
			move_and_slide(target_position * speed, Vector2.UP)








