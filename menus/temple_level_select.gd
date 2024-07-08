extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://world_selector.tscn")



func _on_button_one_pressed():
	if ResourceLoader.exists("res://worlds/level_1-1.tscn"):
		get_tree().change_scene_to_file("res://worlds/level_1-1.tscn")
	else: 
		$levelerror.text = "Sorry, level 1-1 has not been implemented yet"

func _on_button_one_mouse_entered():
	$Currentbesttime.text = "1-1 Best Time: %02d:" % Besttime.bestmin[1] + "%02d:" % Besttime.bestsec[1] + "%02d" % Besttime.bestmsec[1]

func _on_button_two_pressed():
	if ResourceLoader.exists("res://worlds/level_1-2.tscn"):
		get_tree().change_scene_to_file("res://worlds/level_1-2.tscn")
	else: 
		$levelerror.text = "Sorry, level 1-2 has not been implemented yet"
		
func _on_button_two_mouse_entered():
	
	$Currentbesttime.text = "1-2 Best Time: %02d:" % Besttime.bestmin[2] + "%02d:" % Besttime.bestsec[2] + "%02d" % Besttime.bestmsec[2]


func _on_button_three_pressed():
	if ResourceLoader.exists("res://worlds/level_1-3.tscn"):
		get_tree().change_scene_to_file("res://worlds/level_1-3.tscn")
	else: 
		$levelerror.text = "Sorry, level 1-3 has not been implemented yet"

func _on_button_three_mouse_entered():
	$Currentbesttime.text = "1-3 Best Time: %02d:" % Besttime.bestmin[3] + "%02d:" % Besttime.bestsec[3] + "%02d" % Besttime.bestmsec[3]


func _on_button_four_pressed():
	if ResourceLoader.exists("res://worlds/level_1-4.tscn"):
		get_tree().change_scene_to_file("res://worlds/level_1-4.tscn")
	else: 
		$levelerror.text = "Sorry, level 1-4 has not been implemented yet"

func _on_button_four_mouse_entered():
	$Currentbesttime.text = "1-4 Best Time: %02d:" % Besttime.bestmin[4] + "%02d:" % Besttime.bestsec[4] + "%02d" % Besttime.bestmsec[4]

func _on_button_five_pressed():
	if ResourceLoader.exists("res://worlds/level_1-5.tscn"):
		get_tree().change_scene_to_file("res://worlds/level_1-5.tscn")
	else: 
		$levelerror.text = "Sorry, level 1-5 has not been implemented yet"

func _on_button_five_mouse_entered():
	$Currentbesttime.text = "1-5 Best Time: %02d:" % Besttime.bestmin[5] + "%02d:" % Besttime.bestsec[5] + "%02d" % Besttime.bestmsec[5]

func _on_button_six_pressed():
	if ResourceLoader.exists("res://worlds/level_1-6.tscn"):
		get_tree().change_scene_to_file("res://worlds/level_1-6.tscn")
	else: 
		$levelerror.text = "Sorry, level 1-6 has not been implemented yet"






func _on_back_button_button_down():
	get_tree().change_scene_to_file("res://world_selector.tscn")



