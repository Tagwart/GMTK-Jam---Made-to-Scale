extends CharacterBody2D

var input_direction:Vector2 = Vector2.ZERO
var holding_jump:bool = false
var jump_just_released:bool = false
var jump_countdown:int = 0
var gravity_multiplier:float = 1.2

const MAX_SPEED:float = 20000.0
const ACCELERATION:float = 5000.0
const JUMP_FORCE:float = 8000.0
const JUMP_FRAMES:int = 4


func _ready() -> void:
	Global.spawn_point = global_position

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_echo():
		input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if event.is_action("jump"):
		if event.is_pressed(): holding_jump = true
		else: 
			jump_just_released = true
			holding_jump = false
	
	


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * gravity_multiplier * delta
	else: 
		jump_countdown = JUMP_FRAMES
	
	# Handle jump
	if holding_jump and jump_countdown > 0:
		velocity.y = velocity.y - JUMP_FORCE * delta
		jump_countdown -= 1
	elif jump_just_released and velocity.y < 0:
		velocity.y = velocity.y * 0.5
	
	velocity.x = velocity.move_toward(input_direction * MAX_SPEED * delta, ACCELERATION * delta).x
	
	move_and_slide()
	
	jump_just_released = false


func _on_out_of_bounds() -> void:
	global_position = Global.spawn_point
