extends Control


func _on_play_again_pressed() -> void:
	AudioManager.play_btn()
	get_tree().change_scene_to_file("res://Scenes/Mode_Select.tscn")

func _on_back_to_main_menu_pressed() -> void:
	AudioManager.play_btn()
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")
