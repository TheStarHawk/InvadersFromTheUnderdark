extends CharacterBody2D

var moveSpeed = 2400

func _input(event: InputEvent):
	var fireball = preload("res://scenes/fireBall.tscn").instantiate()
	fireball.position = Vector2(position.x, position.y - 20)
	if Input.is_action_pressed("Fire"):
		if $Timer.is_stopped():
			$"../../Projectiles".add_child(fireball)
			$Timer.start()
		
func _physics_process(delta):
	if Input.is_action_pressed("Left") or Input.is_action_pressed("Right"):
		if Input.is_action_pressed("Right"):
			velocity.x = moveSpeed * delta
		if Input.is_action_pressed("Left"):
			velocity.x = -moveSpeed * delta
		if Input.is_action_pressed("Left") and Input.is_action_pressed("Right"):
			velocity.x = 0
	else:
		velocity.x = 0
	move_and_slide()
