extends AnimatableBody2D


@export_range(0, 1000, 10, 'suffix:px/s') 
var speed: float

var ball_pos: Vector2
var dist : int
var move_by : int
var bound : int
var p_height : int

func _ready():
	bound = 308
	p_height = 192

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ball_pos = $"../Ball".position
	dist = position.y - ball_pos.y
	
	if abs(dist) > speed * delta:
		move_by = speed * delta * (dist/abs(dist))
	else:
		move_by = dist
	
	position.y -= move_by
	
	position.y = clamp(position.y, -bound - p_height/2, bound + p_height/2)	
	
