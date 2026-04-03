extends Control

@onready var music_slider = $VBoxContainer/MusicContainer/MusicSlider
@onready var sfx_slider = $VBoxContainer/SfxContainer/SFXSlider
@onready var music_value_label = $VBoxContainer/MusicContainer/MusicValue
@onready var sfx_value_label = $VBoxContainer/SfxContainer/SFXValue

func _ready():
	music_slider.value = AudioManager.music_volume
	sfx_slider.value = AudioManager.sfx_volume
	music_value_label.text = str(int(AudioManager.music_volume * 100)) + "%"
	sfx_value_label.text = str(int(AudioManager.sfx_volume * 100)) + "%"

func _on_music_slider_value_changed(value: float):
	AudioManager.set_music_volume(value)
	music_value_label.text = str(int(value * 100)) + "%"

func _on_sfx_slider_value_changed(value: float):
	AudioManager.set_sfx_volume(value)
	sfx_value_label.text = str(int(value * 100)) + "%"

func _on_exit_pressed() -> void:
	AudioManager.play_btn()
	if GameManager.came_from_game:
		GameManager.came_from_game = false
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")
