extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Names/1".text = "#1 " + str(HighScores.HighScore1)
	$"Names/2".text = "#2 " + str(HighScores.HighScore2)
	$"Names/3".text = "#3 " + str(HighScores.HighScore3)
	$"Names/4".text = "#4 " + str(HighScores.HighScore4)
	$"Names/5".text = "#5 " + str(HighScores.HighScore5)
	$"Names/6".text = "#6 " + str(HighScores.HighScore6)
	$"Names/7".text = "#7 " + str(HighScores.HighScore7)
	$"Names/8".text = "#8 " + str(HighScores.HighScore8)
	$"Names/9".text = "#9 " + str(HighScores.HighScore9)
	$"Names/10".text = "#10 " + str(HighScores.HighScore10)
	
	$"Initials/1".text = HighScores.Initials1
	$"Initials/2".text = HighScores.Initials2
	$"Initials/3".text = HighScores.Initials3
	$"Initials/4".text = HighScores.Initials4
	$"Initials/5".text = HighScores.Initials5
	$"Initials/6".text = HighScores.Initials6
	$"Initials/7".text = HighScores.Initials7
	$"Initials/8".text = HighScores.Initials8
	$"Initials/9".text = HighScores.Initials9
	$"Initials/10".text = HighScores.Initials10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/node_2d.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings_menu.tscn")
