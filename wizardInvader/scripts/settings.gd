extends Node

var MasterVolume = 100
var MusicVolume = 100
var SFXVolume = 100
var BackgroundColor = 514666

func _ready():
	loadSettings()
	

func settingsDict():
	var save_dict = {
		"MasterVolume" = MasterVolume,
		"MusicVolume" = MusicVolume,
		"SFXVolume" = SFXVolume
	}
	return save_dict
	
func saveSettings():
	var saveFile = FileAccess.open("user://Settings.save", FileAccess.WRITE)
	saveFile.store_line(JSON.stringify(settingsDict()))
	
func loadSettings():
	if not FileAccess.file_exists("user://Settings.save"):
		var saveFile = FileAccess.open("user://Settings.save", FileAccess.WRITE)
		saveFile.store_line(JSON.stringify(settingsDict()))
		
	var save_file = FileAccess.open("user://Settings.save", FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()
			# Creates the helper class to interact with JSON.
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure.
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		# Get the data from the JSON object.
		var settings = json.data
		
		MasterVolume = settings["MasterVolume"]
		MusicVolume = settings["MusicVolume"]
		SFXVolume = settings["SFXVolume"]
