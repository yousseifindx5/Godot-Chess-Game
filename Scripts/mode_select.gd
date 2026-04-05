extends Control

func _on__players_pressed() -> void:
	AudioManager.play_btn()
	GameManager.game_mode = "2player"
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_vs_computer_pressed() -> void:
	AudioManager.play_btn()
	get_tree().change_scene_to_file("res://Scenes/Difficulty Select.tscn")

func _on_back_pressed() -> void:
	AudioManager.play_btn()
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")
