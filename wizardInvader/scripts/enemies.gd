extends Node2D

func _process(delta: float) -> void:
	position.x += $"..".enemyDirection * $"..".enemySpeed * delta
	position.y = $"..".enemyPosition
	if get_child_count() == 0:
		$"..".reset()
		queue_free()
