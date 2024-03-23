extends Area2D

export var speed = 500.0

var bound_max_x = 900 #max value of position.x that paddle can have
var bound_min_x = 100 #min value of position.x that paddle can have

var move_direction = 0.0 #no movement, paddle can move only left/right so using float
var prev_position_x
var velocity_x
var paddle_size

func _ready():
	prev_position_x = position.x

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
	velocity_x = (position.x - prev_position_x) / delta
	prev_position_x = position.x
