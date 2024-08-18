extends Node2D

signal out_of_bounds


func _on_bounds_area_body_exited(body: Node2D) -> void:
	emit_signal("out_of_bounds")
