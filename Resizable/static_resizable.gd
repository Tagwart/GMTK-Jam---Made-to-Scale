extends StaticBody2D

# Defines enums
enum HorizontalDirectionEnum {
	Left,
	Right,
	Both
}

enum VerticalDirectionEnum {
	Up,
	Down,
	Both
}

# Exports
@export var horizontal_direction: HorizontalDirectionEnum
@export var vertical_direction: VerticalDirectionEnum
@export var max_size: Vector2 = Vector2(5, 5)
@export var min_size: Vector2 = Vector2(1, 1)
@export var speed: float = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(1):
		self.scale += Vector2(speed, speed)
		if self.scale > max_size:
			self.scale = max_size
	
	elif Input.is_mouse_button_pressed(2):
		self.scale -= Vector2(speed, speed)
		if self.scale < min_size:
			self.scale = min_size
