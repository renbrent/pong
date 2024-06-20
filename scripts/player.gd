extends AnimatableBody2D

@export_range(0, 1000, 10, 'suffix:px/s') var speed: float

var p_height : int

func _ready():
	p_height = 192

func _physics_process(delta):
	var dir = Input.get_axis("up", "down")
	var move = Vector2.DOWN * dir * speed * delta
	move_and_collide(move)


