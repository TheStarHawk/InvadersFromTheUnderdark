extends Area2D

var stage : int = 0

func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	stage += 1
	match stage:
		1: $Sprite2D.modulate = "ffd22ed4"
		2: $Sprite2D.modulate = "ffa12ed4"
		3: $Sprite2D.modulate = "ff692ed4"
		4: $Sprite2D.modulate = "ff352ed4"
		5: queue_free()
