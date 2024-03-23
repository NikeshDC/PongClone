extends Node2D

var ball
export var initial_ball_position = Vector2()

var paddle1
var paddle2
var paddleAI

var gameoverlabel

var game_playing = false

func _ready():
	ball = $ball
	paddle1 = $paddle1
	paddle2 = $paddle2
	paddleAI = $paddleAI
	gameoverlabel = $gameoverText
	
	paddle1.bound_max_x = $wall_right.position.x
	paddle2.bound_max_x = $wall_right.position.x
	paddle1.bound_min_x = $wall_left.position.x
	paddle2.bound_min_x = $wall_left.position.x

func play_game():
	gameoverlabel.set_visible(false)
	ball.position = initial_ball_position
	ball.set_visible(true)
	ball.move_in_random_dir()
	game_playing = true
	paddleAI.get_node("AIcontroller").ballnode = ball

func on_gameover(gameoverText):
	game_playing = false
	ball.set_visible(false)
	gameoverlabel.text = gameoverText
	gameoverlabel.set_visible(true)
	paddleAI.get_node("AIcontroller").ballnode = null
	
func _process(delta):
	if(game_playing):
		if ball.position.y >= paddle1.position.y: #paddle1 is in increasing y 
			on_gameover("-game over: p2 wins-")
		elif ball.position.y <= paddle2.position.y:  #paddle2 is in decreasing y 
			on_gameover("-game over: p1 wins-")
			

func _on_play_button_button_down():
	play_game()
