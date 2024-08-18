extends Node2D

@onready var flag_sprite:Sprite2D = $FlagSprite


func _on_flag_area_body_entered(body: Node2D) -> void:
	Global.spawn_point = global_position
	flag_sprite.frame = 1
