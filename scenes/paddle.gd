extends Area2D

export var speed = 10

var bound_max_x = 900 #max value of position.x that paddle can have
var bound_min_x = 100 #min value of position.x that paddle can have

var move_direction = 0.0 #no movement, paddle can move only left/right so using float

export var player = 1


func move(amount):
	position.x += amount
	#restrcting inside bound
	if(position.x <= bound_min_x):
		position.x = bound_min_x
	elif(position.x >= bound_max_x):
		position.x = bound_max_x
		
func set_movement_dir(direction):
	move_direction = clamp(direction, -1.0, 1.0)

func _physics_process(delta):
	var movement_x = move_direction * speed * delta
	move(movement_x)

func get_player1_input():
	if(Input.is_key_pressed(KEY_RIGHT)):
		set_movement_dir(1.0)
	elif(Input.is_key_pressed(KEY_LEFT)):
		set_movement_dir(-1.0)
	else:
		set_movement_dir(0.0)

func get_player2_input():
	if(Input.is_key_pressed(KEY_D)):
		set_movement_dir(1.0)
	elif(Input.is_key_pressed(KEY_A)):
		set_movement_dir(-1.0)
	else:
		set_movement_dir(0.0)

func _process(delta):
	#arrow input for player
	if(player == 1):
		get_player1_input()
	elif(player == 2):
		get_player2_input()
