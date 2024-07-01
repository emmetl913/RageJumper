extends Control


func _ready():
	get_tree().paused = false

func _on_quit_button_pressed():
	get_tree().quit()


func _on_start_game_pressed():
	Besttime.load_data()
	get_tree().change_scene_to_file("res://world_selector.tscn")
	


func _on_control_button_pressed():
	get_tree().change_scene_to_file("res://menus/control.tscn")


func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://worlds/tutorial.tscn")
