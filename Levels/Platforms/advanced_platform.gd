extends Node2D

@export_range(0.0, 5.0) var grow_x_speed:float = 1.0
@export_range(0.0, 5.0) var grow_y_speed:float = 1.0
@export_range(1.0, 10.0) var big_target:float = 1.0
@export_range(0.5, 5.0) var small_target:float = 0.5
var big:bool = true
var grow_rate:float = 2.0
var big_scale:Vector2 = Vector2(1.0, 1.0)
var small_scale:Vector2 = Vector2(0.5, 0.5)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("swap_size"):
			big = !big


func _physics_process(delta: float) -> void:
	big_scale = Vector2(big_target, big_target)
	small_scale = Vector2(small_target, small_target)
	if big:
		#scale.x = scale.move_toward(big_scale, grow_rate * delta * grow_x_speed).x
		#scale.y = scale.move_toward(big_scale, grow_rate * delta * grow_y_speed).y
		scale.x = step_toward(scale.x, big_target, grow_rate * delta * grow_x_speed)
		scale.y = step_toward(scale.y, big_target, grow_rate * delta * grow_y_speed)
	else:
		#scale.x = scale.move_toward(small_scale, grow_rate * delta * grow_x_speed).x
		#scale.y = scale.move_toward(small_scale, grow_rate * delta * grow_y_speed).y
		scale.x = step_toward(scale.x, small_target, grow_rate * delta * grow_x_speed)
		scale.y = step_toward(scale.y, small_target, grow_rate * delta * grow_y_speed)


func step_toward(value:float, target:float, step:float) -> float:
	if value == target: return value
	var result:float = value
	
	if value < target:
		if value + step > target:
			result = target
		else:
			result = value + step
	else:
		if value - step < target:
			result = target
		else:
			result = value - step
		
	
	return result
