extends CharacterBody2D

var win_size : Vector2
var speed: int
var dir: Vector2
const MAX_Y_VECTOR : float = 0.6

@export_range(0, 1000, 10, 'suffix:px/s')
var start_speed : float

@export_range(0, 1000, 10, 'suffix:px/s')
var accelerate : float

func _ready():
	win_size = get_viewport_rect().size
	
func new_ball():
	# randomize start position and direction
	position.x = 0
	position.y = randi_range(-450, 450)
	speed = start_speed
	dir = random_direction()
	
func random_direction():
	var new_dir := Vector2()
	new_dir.x = [1, -1].pick_random()
	new_dir.y = randf_range(-1,1)
	return new_dir.normalized()

func new_direction(collider):
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y
	var new_dir := Vector2()
	
	if dir.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1 
	new_dir.y = (dist / (collider.p_height / 2)) * MAX_Y_VECTOR
	return new_dir.normalized()
	
	
func _physics_process(delta):
	var collision = move_and_collide(dir * speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		if collider == $"../Player" or collider == $"../CPU":
			speed += accelerate
			dir = new_direction(collider)
		else:
			dir = dir.bounce(collision.get_normal())
