extends Area2D

export var speed = 10

var direction = Vector2()


# Called when the node enters the scene tree for the first time.
func move_in_random_dir():
	direction = Vector2(rand_range(0, 1), rand_range(0, 1)).normalized()
	
	
func _process(delta):
	position += direction * speed

func _on_area_entered(area):
	if(area.is_in_group("paddle")):
		direction.y *= -1
	elif(area.is_in_group("wall")):
		direction.x *= -1
