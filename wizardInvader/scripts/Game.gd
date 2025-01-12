extends Node2D

var score : int = 0
var lives : int = 3
var turnAroundTimer : bool = true
@onready var Enemies = preload("res://scenes/enemies.tscn").instantiate()
var enemySpeed = 50
var enemyDirection = 1
var enemyPosition = 200
var shotCount : int
var wave : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Enemies.position = Vector2(320, 200)
	add_child(Enemies)
	
func reset():
	$BackGround.pitch_scale = .95
	score += 100
	wave += 1
	$CanvasLayer/Label3.text = "Wave: " + str(wave +1)
	$resetTimer.start()

func _on_enemy_border_area_entered(area: Area2D) -> void:
	if turnAroundTimer == true:
		enemyDirection *= -1
		enemyPosition += 10
		turnAroundTimer = false
		$Borders/EnemyBorder/Timer.start()

func _on_timer_timeout() -> void:
	turnAroundTimer = true

func _process(delta: float) -> void:
	$CanvasLayer/Label.text = "Score: " + str(score)

func GameOver():
	$GameOver.play()
	if score > HighScores.HighScore10:
		$CanvasLayer/GameOverScreen/LineEdit.visible = true
	$CanvasLayer/GameOverScreen.visible = true
	get_tree().paused = true

func _on_game_over_area_entered(area: Area2D) -> void:
	GameOver()

func _on_menu_pressed() -> void:
	get_tree().paused = false
	setHighScore()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_restart_pressed() -> void:
	get_tree().paused = false
	setHighScore()
	get_tree().reload_current_scene()


func _on_reset_timer_timeout() -> void:
	$WaveComplete.play()
	shotCount = 0
	Enemies = preload("res://scenes/enemies.tscn").instantiate()
	enemySpeed = 50 + (wave * 10)
	enemyDirection = 1
	enemyPosition = 200
	Enemies.position = Vector2(320, 200)
	add_child(Enemies)

func setHighScore():
	if score > HighScores.HighScore10:
		if score > HighScores.HighScore9:
			HighScores.HighScore10 = HighScores.HighScore9
			HighScores.Initials10 = HighScores.Initials9
			if score > HighScores.HighScore8:
				HighScores.HighScore9 = HighScores.HighScore8
				HighScores.Initials9 = HighScores.Initials8
				if score > HighScores.HighScore7:
					HighScores.HighScore8 = HighScores.HighScore7
					HighScores.Initials8 = HighScores.Initials7
					if score > HighScores.HighScore6:
						HighScores.HighScore7 = HighScores.HighScore6
						HighScores.Initials7 = HighScores.Initials6
						if score > HighScores.HighScore5:
							HighScores.HighScore6 = HighScores.HighScore5
							HighScores.Initials6 = HighScores.Initials5
							if score > HighScores.HighScore4:
								HighScores.HighScore5 = HighScores.HighScore4
								HighScores.Initials5 = HighScores.Initials4
								if score > HighScores.HighScore3:
									HighScores.HighScore4 = HighScores.HighScore3
									HighScores.Initials4 = HighScores.Initials3
									if score > HighScores.HighScore2:
										HighScores.HighScore3 = HighScores.HighScore2
										HighScores.Initials3 = HighScores.Initials2
										if score > HighScores.HighScore1:
											HighScores.HighScore2 = HighScores.HighScore1
											HighScores.Initials2 = HighScores.Initials1
											HighScores.HighScore1 = score
											HighScores.Initials1 = $CanvasLayer/GameOverScreen/LineEdit.text
										else:
											HighScores.HighScore2 = score
											HighScores.Initials2 = $CanvasLayer/GameOverScreen/LineEdit.text
									else:
										HighScores.HighScore3 = score
										HighScores.Initials3 = $CanvasLayer/GameOverScreen/LineEdit.text
								else:
									HighScores.HighScore4 = score
									HighScores.Initials4 = $CanvasLayer/GameOverScreen/LineEdit.text
							else:
								HighScores.HighScore5 = score
								HighScores.Initials5 = $CanvasLayer/GameOverScreen/LineEdit.text
						else:
							HighScores.HighScore6 = score
							HighScores.Initials6 = $CanvasLayer/GameOverScreen/LineEdit.text
					else:
						HighScores.HighScore7 = score
						HighScores.Initials7 = $CanvasLayer/GameOverScreen/LineEdit.text
				else:
					HighScores.HighScore8 = score
					HighScores.Initials8 = $CanvasLayer/GameOverScreen/LineEdit.text
			else:
				HighScores.HighScore9 = score
				HighScores.Initials9 = $CanvasLayer/GameOverScreen/LineEdit.text
		else:
			HighScores.HighScore10 = score
			HighScores.Initials10 = $CanvasLayer/GameOverScreen/LineEdit.text
	else:
		pass
	HighScores.saveScores()
