extends Node2D

var player_has_gem : bool
var old_health : int
var full_hearts : int
var half_hearts : int
var empty_hearts : int
@onready var player = get_node("Player")
var health: int
var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0 

@export var timesave_index: int
# Called when the node enters the scene tree for the first time.
func _ready():
	print("Best min: ", Besttime.bestmin, " Best sec: ", Besttime.bestsec, " Best msec: ", Besttime.bestmsec)
	player_has_gem = false
	health = player.health
	old_health = health +1 


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	#Camera controls
	$Camera2D.position.y = 128 + (floor($Player.position.y / 256) * 256)
	if $SacredGemNode/SacredGemSprite.visible == false:
		player_has_gem = true
		$DoorNode.has_gem = true
		if $DoorNode.leaving == true:
				if minutes <= Besttime.bestmin[timesave_index]:
					Besttime.bestmin[timesave_index] = minutes
					if seconds <= Besttime.bestsec[timesave_index]:
						Besttime.bestsec[timesave_index] = seconds
						if msec <= Besttime.bestmsec[timesave_index]:
								Besttime.bestmsec[timesave_index] = msec
				print("Current Run: Best min: ", minutes, " Best sec: ", seconds, " Best msec: ", msec)
				Besttime.save(timesave_index, Besttime.bestmin[timesave_index], Besttime.bestsec[timesave_index], Besttime.bestmsec[timesave_index])
				print("New: Best min: ", Besttime.bestmin[timesave_index], " Best sec: ", Besttime.bestsec[timesave_index], " Best msec: ", Besttime.bestmsec[timesave_index])
				get_tree().change_scene_to_file("res://menus/MainMenu.tscn")
	
	time += delta
	msec = fmod(time, 1) *100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	$Camera2D/UI/GameTime/minutes.text = "%02d:" % minutes
	$Camera2D/UI/GameTime/minutes2.text = "%02d:" % minutes
	$Camera2D/UI/GameTime/seconds.text = "%02d:" % seconds
	$Camera2D/UI/GameTime/seconds2.text = "%02d:" % seconds
	$Camera2D/UI/GameTime/milliseconds.text = "%02d" % msec
	$Camera2D/UI/GameTime/milliseconds2.text = "%02d" % msec
	
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = not get_tree().paused
		if get_tree().paused:
			$Camera2D/PauseMenu.visible = true
		else:
			$Camera2D/PauseMenu.visible = false
	health = player.health
	if health < old_health:
		calculate_health_display(health)
		old_health -= 1
		

func calculate_health_display(health):
	print(health)
	if health <= 6:
		if health % 2 != 1:
			if health == 6:
				$Camera2D/UI/Health/health1.texture = load("res://assets/heart.png")
				$Camera2D/UI/Health/health2.texture = load("res://assets/heart.png")
				$Camera2D/UI/Health/health3.texture = load("res://assets/heart.png")
			if health == 4:
				$Camera2D/UI/Health/health1.texture = load("res://assets/heart.png")
				$Camera2D/UI/Health/health2.texture = load("res://assets/heart.png")
				$Camera2D/UI/Health/health3.texture = load("res://assets/emptyheart.png")
			if health == 2:
				$Camera2D/UI/Health/health1.texture = load("res://assets/heart.png")
				$Camera2D/UI/Health/health2.texture = load("res://assets/emptyheart.png")
			if health == 0:
				$Camera2D/UI/Health/health1.texture = load("res://assets/emptyheart.png")
				$Camera2D/UI/Health/health2.texture = load("res://assets/emptyheart.png")
		elif health % 2 == 1:
			if health == 5:
				$Camera2D/UI/Health/health1.texture = load("res://assets/heart.png")
				$Camera2D/UI/Health/health2.texture = load("res://assets/heart.png")
				$Camera2D/UI/Health/health3.texture = load("res://assets/halfheart.png")
			if health == 3:
				$Camera2D/UI/Health/health2.texture = load("res://assets/halfheart.png")
				$Camera2D/UI/Health/health1.texture = load("res://assets/heart.png")
			if health == 1:
				$Camera2D/UI/Health/health2.texture = load("res://assets/emptyheart.png")
				$Camera2D/UI/Health/health1.texture = load("res://assets/halfheart.png")

func _on_resume_pressed():
	get_tree().paused = false
	$Camera2D/PauseMenu.visible = false


func _on_return_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://menus/MainMenu.tscn")





func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
