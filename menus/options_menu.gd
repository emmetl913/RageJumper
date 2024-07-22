extends Control


func _ready():
	print(typeof(AudioPlayer.volume_db), ": ", AudioPlayer.volume_db)
	$Options/VBoxContainer/HSlider.value = (AudioPlayer.volume_db+25)*4
	print("Current Volume: ", AudioPlayer.volume_db)


func _process(delta):
	$Options/VBoxContainer/HSlider/VolumeValue.text = str(int($Options/VBoxContainer/HSlider.value))


func _on_return_button_pressed():
	get_tree().change_scene_to_file("res://menus/MainMenu.tscn")


func _on_volume_button_pressed():
	$Options/VBoxContainer/HSlider.visible = not $Options/VBoxContainer/HSlider.visible


func _on_controls_button_pressed():
	get_tree().change_scene_to_file("res://menus/control.tscn")


func _on_h_slider_drag_ended(value_changed):
	AudioPlayer.volume_db = ($Options/VBoxContainer/HSlider.value/4) - 25
	print("New Volume: ", AudioPlayer.volume_db)
	SettingsData.volume = AudioPlayer.volume_db
	SettingsData.save()
