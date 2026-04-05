extends Control

func _ready():
	AudioManager.start_music()

func _on_start_button_pressed() -> void:
	AudioManager.play_btn()
	get_tree().change_scene_to_file("res://Scenes/Mode_Select.tscn")

func _on_options_pressed() -> void:
	AudioManager.play_btn()
	get_tree().change_scene_to_file("res://Scenes/Options Menu.tscn")
	
func _on_exit_pressed() -> void:
	get_tree().quit()
