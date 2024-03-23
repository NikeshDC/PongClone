extends Node

export var player = 1

onready var paddlenode = $".."

func get_player1_input():
	if(Input.is_key_pressed(KEY_RIGHT)):
		paddlenode.set_movement_dir(1.0)
	elif(Input.is_key_pressed(KEY_LEFT)):
		paddlenode.set_movement_dir(-1.0)

func get_player2_input():
	if(Input.is_key_pressed(KEY_D)):
		paddlenode.set_movement_dir(1.0)
	elif(Input.is_key_pressed(KEY_A)):
		paddlenode.set_movement_dir(-1.0)
		
func _process(delta):
	paddlenode.set_movement_dir(0.0)
	#arrow input for player
	if(player == 1):
		get_player1_input()
	elif(player == 2):
		get_player2_input()
