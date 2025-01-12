extends Area2D

@export var Type : String

func _ready() -> void:
	$ShotTimer.wait_time = randi_range(4, 10)
	$ShotTimer.start()
	$AnimatedSprite2D.play("default")

func _process(delta: float) -> void:
	if $"../..".enemyDirection > 0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
	


func _on_body_entered(body: Node2D) -> void:
	if body.name != "Border":
		if body.shooter == "Wizard":
			$"../../BackGround".pitch_scale += .01
			$"../..".enemySpeed += 3
			var explosion = preload("res://scenes/explosion.tscn").instantiate()
			explosion.global_position = body.global_position
			explosion.emitting = true
			$"../../Particles".add_child(explosion)
			body.queue_free()
			match Type:
				"Slime":
					$"../..".score += 10
				"Mimic":
					$"../..".score += 20
				"Myconid":
					$"../..".score += 40
			queue_free()

func _on_shot_timer_timeout() -> void:
	if $"../..".shotCount < 3:
		$"../..".shotCount += 1
		var projectile = preload("res://scenes/fireBall.tscn").instantiate()
		projectile.shooter = Type
		projectile.global_position = Vector2(global_position.x, global_position.y + 20)
		$"../../Projectiles".add_child(projectile)
	$ShotTimer.wait_time = randi_range(4, 10)
	$ShotTimer.start()
