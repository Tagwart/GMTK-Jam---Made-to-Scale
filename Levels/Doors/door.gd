extends Node2D

@export var max: Vector2 = Vector2(1.0, 1.0)
@export var min: Vector2 = Vector2(1.0, 0.5)
@export var speed: Vector2 = Vector2(0.5, 0.5)
@export var toggled: bool = false

func _physics_process(delta: float) -> void:
	var target: Vector2 = max
	var direction: int = 1
	if toggled == true:
		target = min
		direction = -1
	
	if scale.x < target.x and direction == 1 or scale.x > target.x and direction == -1:
		scale.x += speed.x * delta * direction
	
	else:
		scale.x = target.x
	
	if scale.y < target.y and direction == 1 or scale.y > target.y and direction == -1:
		scale.y += speed.y * delta * direction
		
	else:
		scale.y = target.y
	
func toggle():
	toggled = !toggled
