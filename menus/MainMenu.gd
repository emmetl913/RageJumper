extends Control


func _ready():
	get_tree().paused = false


func _on_quit_button_pressed():
	get_tree().quit()


func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://worlds/main.tscn")
