extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = not get_tree().paused
		if get_tree().paused:
			$PauseMenu.visible = true
		else:
			$PauseMenu.visible = false


func _on_resume_pressed():
	get_tree().paused = not get_tree().paused
	$PauseMenu.visible = false


func _on_return_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://menus/MainMenu.tscn")
