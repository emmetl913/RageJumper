extends Control

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://menus/MainMenu.tscn")

func _on_world_1_pressed():
	get_tree().change_scene_to_file("res://menus/temple_level_select.tscn")

func _on_mainmenubutton_pressed():
	get_tree().change_scene_to_file("res://menus/MainMenu.tscn")
