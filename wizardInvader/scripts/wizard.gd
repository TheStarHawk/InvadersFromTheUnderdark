extends CharacterBody2D

enum State {NORMAL, DEAD}
var state = State.NORMAL
var moveSpeed = 5000
var canFire : bool = true
var Lives : int = 3

func _physics_process(delta):
	match state:
		State.NORMAL:
			if Input.is_action_pressed("Left") or Input.is_action_pressed("Right"):
				if Input.is_action_pressed("Right"):
					velocity.x = moveSpeed * delta
				if Input.is_action_pressed("Left"):
					velocity.x = -moveSpeed * delta
				if Input.is_action_pressed("Left") and Input.is_action_pressed("Right"):
					velocity.x = 0
			else:
				velocity.x = 0
				
			if Input.is_action_pressed("Fire"):
				if canFire == true:
					fireBall()
			move_and_slide()
		
		State.DEAD:
			pass

func fireBall():
	canFire = false
	var fireball = load("res://scenes/fireBall.tscn").instantiate()
	fireball.shooter = "Wizard"
	fireball.position = Vector2(position.x, position.y - 20)
	$"../../Projectiles".add_child(fireball)

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.name != "Wizard":
		body.queue_free()
		die()


func _on_projectile_tree_exited() -> void:
	canFire = true
	
func die():
	var children = $"../../Projectiles".get_children()
	for child in children:
		child.free()
	$Timer.start()
	get_tree().paused = true
	$AnimatedSprite2D.play("ded")
	$Die.play()
	state = State.DEAD
	$"../..".lives -= 1
	match $"../..".lives:
		2:
			$"../../CanvasLayer/Wizard3".visible = false
		1:
			$"../../CanvasLayer/Wizard2".visible = false
		0:
			$"../../CanvasLayer/Wizard".visible = false


func _on_timer_timeout() -> void:
	if $"../..".lives > 0:
		$AnimatedSprite2D.animation = "default"
		state = State.NORMAL
		get_tree().paused = false
	else:
		$"../..".GameOver()
