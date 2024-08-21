extends Area2D

func _on_body_entered(body: Node2D) -> void:
	scale = Vector2(1, 0.5)
	get_tree().call_group("doors", "toggle")

func _on_body_exited(body: Node2D) -> void:
	scale = Vector2(1, 1)
