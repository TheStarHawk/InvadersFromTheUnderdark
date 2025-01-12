extends CharacterBody2D

var shooter : String
var direction : int
var player = preload("res://scenes/wizard.tscn")
var speed : int

func _ready():
	match shooter:
		"Wizard":
			$Fireball.visible = true
			$Fireball/Fireball.play("default")
			direction = -1
			speed = 5
			$AudioStreamPlayer2D.stream = load("res://audio/FireBall.wav")
			$AudioStreamPlayer2D.volume_db = 1.5
		"Mimic":
			$GoldCoin.visible = true
			direction = 1
			speed = 3
			$AudioStreamPlayer2D.stream = load("res://audio/GoldCoin.wav")
		"Slime":
			$SlimeBall.visible = true
			direction = 1
			speed = 3
			$AudioStreamPlayer2D.stream = load("res://audio/SlimeBall.wav")
		"Myconid":
			$Spear.visible = true
			direction = 1
			speed = 3
			$AudioStreamPlayer2D.stream = load("res://audio/Spear.wav")
	$AudioStreamPlayer2D.play()

func _physics_process(delta):
	move_and_collide(Vector2(0, speed * direction))
	if position.y < -5 or position.y > 365:
		queue_free()


func _on_tree_exiting() -> void:
	if shooter == "Wizard":
		$"../../Player/Wizard".canFire = true
	else:
		$"../..".shotCount -= 1
