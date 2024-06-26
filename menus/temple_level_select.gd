extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_one_pressed():
	if ResourceLoader.exists("res://worlds/level_1-1.tscn"):
		get_tree().change_scene_to_file("res://worlds/level_1-1.tscn")
	else: 
		$levelerror.text = "Sorry, level 1-1 has not been implemented yet"


func _on_button_two_pressed():
	if ResourceLoader.exists("res://worlds/level_1-2.tscn"):
		get_tree().change_scene_to_file("res://worlds/level_1-2.tscn")
	else: 
		$levelerror.text = "Sorry, level 1-2 has not been implemented yet"


func _on_button_three_pressed():
	if ResourceLoader.exists("res://worlds/level_1-3.tscn"):
		get_tree().change_scene_to_file("res://worlds/level_1-3.tscn")
	else: 
		$levelerror.text = "Sorry, level 1-3 has not been implemented yet"


func _on_button_four_pressed():
	if ResourceLoader.exists("res://worlds/level_1-4.tscn"):
		get_tree().change_scene_to_file("res://worlds/level_1-4.tscn")
	else: 
		$levelerror.text = "Sorry, level 1-4 has not been implemented yet"


func _on_button_five_pressed():
	if ResourceLoader.exists("res://worlds/level_1-5.tscn"):
		get_tree().change_scene_to_file("res://worlds/level_1-5.tscn")
	else: 
		$levelerror.text = "Sorry, level 1-5 has not been implemented yet"


func _on_button_six_pressed():
	if ResourceLoader.exists("res://worlds/level_1-6.tscn"):
		get_tree().change_scene_to_file("res://worlds/level_1-6.tscn")
	else: 
		$levelerror.text = "Sorry, level 1-6 has not been implemented yet"
