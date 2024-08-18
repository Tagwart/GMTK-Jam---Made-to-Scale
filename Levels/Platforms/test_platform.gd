extends StaticBody2D

var big:bool = true
var grow_rate:float = 2.0
const BIG_SCALE:Vector2 = Vector2(1.0, 1.0)
const SMALL_SCALE:Vector2 = Vector2(0.5, 0.5)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("swap_size"):
			big = !big


func _physics_process(delta: float) -> void:
	if big: scale = scale.move_toward(BIG_SCALE, grow_rate * delta)
	else: scale = scale.move_toward(SMALL_SCALE, grow_rate * delta)
