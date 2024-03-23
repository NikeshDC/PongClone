extends Node

onready var paddlenode = $".."
var ballnode

export var movement_threshold = 20.0
		
func _process(delta):
	if ballnode:
		set_paddle_movement()

func set_paddle_movement():
	var vector2ball = ballnode.position.x - paddlenode.position.x
	if(abs(vector2ball) > movement_threshold):
		paddlenode.set_movement_dir(vector2ball)
	else:
		paddlenode.set_movement_dir(0.0)
