extends Node2D

var oldMasterVolume
var oldMusicVolume
var oldSFXVolume
var oldBackgroundColor
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HSeparator/MasterVolume.value = Settings.MasterVolume
	$HSeparator/MusicVolume.value = Settings.MusicVolume
	$HSeparator/SFXVolume.value = Settings.SFXVolume
	$ColorPickerButton.color = ProjectSettings.get_setting("rendering/environment/defaults/default_clear_color")
	oldMasterVolume = Settings.MasterVolume
	oldMusicVolume = Settings.MusicVolume
	oldSFXVolume = Settings.SFXVolume
	oldBackgroundColor = ProjectSettings.get_setting("rendering/environment/defaults/default_clear_color")


func _on_master_volume_drag_ended(value_changed: bool) -> void:
	Settings.MasterVolume = $HSeparator/MasterVolume.value


func _on_music_volume_drag_ended(value_changed: bool) -> void:
	Settings.MusicVolume = $HSeparator/MusicVolume.value


func _on_sfx_volume_drag_ended(value_changed: bool) -> void:
	Settings.SFXVolume = $HSeparator/SFXVolume.value

func _on_color_picker_button_color_changed(color: Color) -> void:
	ProjectSettings.set_setting("rendering/environment/defaults/default_clear_color", color)


func _on_return_pressed() -> void:
	Settings.MasterVolume = oldMasterVolume
	Settings.MusicVolume = oldMusicVolume
	Settings.SFXVolume = oldSFXVolume
	Settings.BackgroundColor = oldBackgroundColor
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_save_pressed() -> void:
	Settings.saveSettings()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
