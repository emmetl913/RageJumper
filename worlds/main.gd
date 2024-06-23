extends Node2D

var old_health : int
var full_hearts : int
var half_hearts : int
var empty_hearts : int

# Called when the node enters the scene tree for the first time.
func _ready():
	old_health = 6


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	#Camera controls
	$Camera2D.position.y = 128 + (floor($Player.position.y / 256) * 256)
	
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
	get_tree().paused = not get_tree().paused
	$Camera2D/PauseMenu.visible = false


func _on_return_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://menus/MainMenu.tscn")



