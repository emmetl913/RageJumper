extends Control


func _ready():
	get_tree().paused = false
	SettingsData.load_data()
	AudioPlayer.volume_db = SettingsData.volume
	AudioPlayer.play_music_title()

func _on_quit_button_pressed():
	get_tree().quit()


func _on_start_game_pressed():
	Besttime.load_data()
	get_tree().change_scene_to_file("res://world_selector.tscn")


func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://worlds/tutorial.tscn")


func _on_title_theme_finished():
	$TitleTheme.play()


func _on_tutorial_mouse_entered():
	$Currentbesttime.text = "Tutorial Best Time: %02d:" % Besttime.bestmin[0] + "%02d:" % Besttime.bestsec[0] + "%02d" % Besttime.bestmsec[0]


func _on_tutorial_mouse_exited():
	$Currentbesttime.text = ""


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://menus/options_menu.tscn")
