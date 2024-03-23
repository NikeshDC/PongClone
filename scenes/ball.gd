extends Area2D

export var speed = 10.0

var direction = Vector2()


# Called when the node enters the scene tree for the first time.
func move_in_random_dir():
	direction = Vector2(rand_range(0, 1), rand_range(0, 1)).normalized()
	
	
func _process(delta):
	position += direction * speed

func _on_area_entered(area):
	if(area.is_in_group("paddle")):
		handle_collision_with_paddle(area)
	elif(area.is_in_group("wall")):
		direction.x *= -1

func handle_collision_with_paddle(paddle):
	direction.x += paddle.velocity_x
	direction.x = clamp(direction.x, -1, 1)
	direction.y *= -1
