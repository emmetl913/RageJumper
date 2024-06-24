extends Control


func _ready():
	get_tree().paused = false
	Besttime.load_data()
	$min.text = "%02d:" % Besttime.bestmin
	$sec.text = "%02d:" % Besttime.bestsec
	$msec.text = "%02d" % Besttime.bestmsec


func _on_quit_button_pressed():
	get_tree().quit()


func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://worlds/main.tscn")
