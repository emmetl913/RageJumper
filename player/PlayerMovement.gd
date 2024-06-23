extends CharacterBody2D

@export var speed = 100
@export var jump_speed = -150
@export var gravity = 600

func _physics_process(delta):
	velocity.y += gravity * delta
	
	velocity.x = Input.get_axis("move_left", "move_right") * speed
	
	move_and_slide()
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
