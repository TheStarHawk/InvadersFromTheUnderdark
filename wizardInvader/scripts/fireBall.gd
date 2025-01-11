extends CharacterBody2D

func _ready():
	$AnimatedSprite2D.play("default")
func _physics_process(delta):
	move_and_collide(Vector2(0, -5))
