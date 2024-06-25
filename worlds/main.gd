extends Node2D

var player_has_gem : bool
var old_health : int
var full_hearts : int
var half_hearts : int
var empty_hearts : int

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0 

# Called when the node enters the scene tree for the first time.
func _ready():
	player_has_gem = false
	old_health = 6


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	#Camera controls
	$Camera2D.position.y = 128 + (floor($Player.position.y / 256) * 256)
	if ($SacredGemNode/SacredGemSprite.visible == false):
		player_has_gem = true
		$DoorNode.has_gem = true
		if ($DoorNode/ExitText.visible == true):
			if Input.is_action_just_released("interact"):
				if minutes <= Besttime.bestmin or Besttime.bestmin == 0:
					if seconds <= Besttime.bestsec or Besttime.bestsec == 0:
						if msec < Besttime.bestmsec or Besttime.bestmsec == 0:
							Besttime.bestsec = seconds
							Besttime.bestmin = minutes
							Besttime.bestmsec = msec
				Besttime.save()
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
	var health = $Player.health
	if health < old_health:
		calculate_health_display(health)
		old_health -= 1

func calculate_health_display(health):
	print(health)
	if health <= 6:
		if health % 2 != 1:
			print(health, " even health")
			full_hearts = health/2
			print(full_hearts, "full hearts")
			if full_hearts == 3:
				$Camera2D/UI/Health/health3.texture = load("res://assets/heart.png")
				$Camera2D/UI/Health/health2.texture = load("res://assets/heart.png")
				$Camera2D/UI/Health/health1.texture = load("res://assets/heart.png")
			if full_hearts == 2:
				$Camera2D/UI/Health/health1.texture = load("res://assets/heart.png")
				$Camera2D/UI/Health/health2.texture = load("res://assets/heart.png")
				$Camera2D/UI/Health/health3.texture = load("res://assets/emptyheart.png")
			if full_hearts == 1:
				$Camera2D/UI/Health/health1.texture = load("res://assets/heart.png")
				$Camera2D/UI/Health/health2.texture = load("res://assets/emptyheart.png")
				$Camera2D/UI/Health/health3.texture = load("res://assets/emptyheart.png")
			if full_hearts == 0:
				$Camera2D/UI/Health/health1.texture = load("res://assets/emptyheart.png")
				$Camera2D/UI/Health/health2.texture = load("res://assets/emptyheart.png")
				$Camera2D/UI/Health/health3.texture = load("res://assets/emptyheart.png")
			empty_hearts = 0
			half_hearts = 0
		elif health % 2 == 1:
			print(health, " odd health")
			full_hearts = health/2
			for i in full_hearts:
				if i == 1:
					$Camera2D/UI/Health/health1.texture = load("res://assets/heart.png")
				if i == 2:
					$Camera2D/UI/Health/health2.texture = load("res://assets/heart.png")
			half_hearts = 1
			if full_hearts == 2:
				$Camera2D/UI/Health/health3.texture = load("res://assets/halfheart.png")
			else:
				$Camera2D/UI/Health/health2.texture = load("res://assets/halfheart.png")
			empty_hearts = 3 - (full_hearts + half_hearts)
			if empty_hearts == 1:
				$Camera2D/UI/Health/health3.texture = load("res://assets/emptyheart.png")
			if empty_hearts == 2:
				$Camera2D/UI/Health/health3.texture = load("res://assets/emptyheart.png")
				$Camera2D/UI/Health/health2.texture = load("res://assets/emptyheart.png")
			if health == 1:
				print(health, " one health")
				full_hearts = 0
				half_hearts = 1
				empty_hearts = 2
				$Camera2D/UI/Health/health3.texture = load("res://assets/emptyheart.png")
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
