extends Area2D

var speed := 300
var screen_size
var bar_height

func _ready():
	screen_size = get_viewport_rect().size
	var collision_shape = $CollisionShape2D
	bar_height = collision_shape.shape.size.y

func _process(delta: float) -> void:
	var direction = Input.get_axis("move_up","move_down")
	var velocity = direction * speed * delta
	_move(velocity)

func _move(velocity) -> void:
	if position.y + velocity > screen_size.y - bar_height / 2 && velocity > 0:
		return
	if position.y + velocity < bar_height / 2 - 30 && velocity < 0:
		return
	position.y += velocity
	
