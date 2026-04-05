extends Control

func _on_easy_pressed() -> void:
	AudioManager.play_btn()
	GameManager.game_mode = "computer"
	GameManager.difficulty = "easy"
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_medium_pressed() -> void:
	AudioManager.play_btn()
	GameManager.game_mode = "computer"
	GameManager.difficulty = "medium"
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_hard_pressed() -> void:
	AudioManager.play_btn()
	GameManager.game_mode = "computer"
	GameManager.difficulty = "hard"
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_back_pressed() -> void:
	AudioManager.play_btn()
	get_tree().change_scene_to_file("res://Scenes/Mode_Select.tscn")
