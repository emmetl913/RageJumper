extends CharacterBody2D

@export var health = 6
@export var speed = 300
@export var jump_speed = -200
@export var jump_scaler = 500
@export var jump_max_speed = -1000
@export var gravity = 1000
@export_range(0.0, 1.0) var friction = 0.1
@export_range(0.0 , 1.0) var acceleration = 0.25

@onready var jumpBar = $BackgroundChargeBar/JumpHeightIndicator
var jumpSpeedStart = jump_speed

func _physics_process(delta):
	velocity.y += gravity * delta
	
	var dir = Input.get_axis("move_left", "move_right")
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration) 
	else:
		velocity.x = lerp(velocity.x, 0.0, friction)
	
	move_and_slide()
	
	
	if Input.is_action_pressed("jump") and is_on_floor():
		jump_speed -= jump_scaler * delta
		scaleJumpBar()
	if Input.is_action_just_released("jump") and is_on_floor():
		if jump_speed < jump_max_speed:
			jump_speed = jump_max_speed
		velocity.y = jump_speed
		jump_speed = -200
		resetJumpBar()
	
func scaleJumpBar():
	jumpBar.scale.y = jump_speed / jump_max_speed
	if jumpBar.scale.y > 1.0:
		jumpBar.scale.y = 1.0
func resetJumpBar():
	jumpBar.scale.y = 0.0
