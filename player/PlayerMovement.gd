extends CharacterBody2D

var can_recieve : bool = true
var coyote_time = 0.1
var can_jump = false

var can_animate_enter_air = false
var can_animate_charge_jump = false
var can_animate_land_jump = false

@export var health = 6
@export var speed = 300
@export var jump_speed = -200
@export var jump_scaler = 500
@export var jump_max_speed = -1000
@export var gravity = 1000
@export_range(0.0, 1.0) var friction = 0.1
@export_range(0.0 , 1.0) var acceleration = 0.25
@export var air_rotation_speed= 30

@onready var jumpBar = $BackgroundChargeBar/JumpHeightIndicator
var jumpSpeedStart = jump_speed

func _physics_process(delta):
	velocity.y += gravity * delta
	
	var dir = Input.get_axis("move_left", "move_right")
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration) 
	else:
		velocity.x = lerp(velocity.x, 0.0, friction)
	if velocity.x != 0 and is_on_floor():
		$AnimationPlayer.play("onRun")
	if velocity.x < 0:
		$Sprite2D.flip_h = false
	if velocity.x > 0:
		$Sprite2D.flip_h = true
	move_and_slide()
	
	
	#rotate player when in air based on x velocity
	if can_jump == false and !is_on_floor():
		#then we are in air
		$Sprite2D.rotation_degrees = lerpf($Sprite2D.rotation_degrees, velocity.normalized().x * air_rotation_speed, .3)
		print(velocity.normalized().x)
	#Jumping code!
	if velocity.y > 0:
		can_animate_land_jump = true
	if is_on_floor() and can_jump == false:
		can_jump = true
		can_animate_charge_jump = true
		$Sprite2D.rotation_degrees = 0
		if can_animate_land_jump:
			$AnimationPlayer.play("onLand")
			can_animate_land_jump = false
	elif can_jump == true and $CoyoteTimer.is_stopped():
		$CoyoteTimer.start(coyote_time)

	if Input.is_action_pressed("jump") and can_jump:
		jump_speed -= jump_scaler * delta
		scaleJumpBar()
		if can_animate_charge_jump:
			$AnimationPlayer.play("onJump")
			can_animate_charge_jump = false
	
		
	if Input.is_action_just_released("jump") and can_jump:
		if jump_speed < jump_max_speed:
			jump_speed = jump_max_speed
		#ACTUALLY JUMP
		velocity.y = jump_speed
		jump_speed = -200
		resetJumpBar()
		can_animate_land_jump = true
		can_animate_enter_air = true
		
	if can_animate_enter_air:
		$AnimationPlayer.play("inAir")	
		can_animate_enter_air = false
		
	if !can_jump:
		resetJumpBar()
	
	detect_collision()

func delete_duplicate_collisions(collisions: Array):
	var unique: Array = []
	for item in collisions:
		if !unique.has(item):
			unique.append(item)
	return unique

func detect_collision():
	var collisionList: Array
	#make array of all names of collisions
	for i in get_slide_collision_count():
		collisionList.append(get_slide_collision(i).get_collider().name)
	var collisionListNames = delete_duplicate_collisions(collisionList)
	for i in collisionListNames:
		if i.contains("DamageColliders") and can_recieve:
			can_recieve = false
			$HurtCooldown.start()
			print("OW")
			health -= 1
			if health > 0:
				$hurt.play()
			else:
				$Sprite2D.visible = false
				$BackgroundChargeBar.visible = false
				$DeathTimer.start()
				$death.play()
				$deathanim.emitting = true
		if i.contains("DoorNode"):
			print("on door")

func _on_death_timer_timeout():
	get_tree().change_scene_to_file("res://menus/MainMenu.tscn")
func _on_hurt_cooldown_timeout():
	can_recieve = true

func scaleJumpBar():
	$BackgroundChargeBar.visible = true
	jumpBar.scale.y = (jump_speed - jumpSpeedStart) / jump_max_speed
	if jumpBar.scale.y > 1.0:
		jumpBar.scale.y = 1.0
func resetJumpBar():
	$BackgroundChargeBar.visible = false
	jumpBar.scale.y = 0.0
	jump_speed = -200


func _on_coyote_timer_timeout():
	can_jump = false
