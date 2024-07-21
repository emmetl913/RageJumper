extends Node

# Dependencies
@onready var host_sprite = get_parent().get_node("Sprite2D")
# Options
@export var pivot_below = false
# Parameters
var x_max = 1.5
var r_max = 10
const STOP_THRESHHOLD = 0.1
const TWEEN_DURATION = 0.05
const RECOVERY_FACTOR = 2.0/3
const TRANSITION_TYPE = Tween.TRANS_SINE


func start():
	
	var x = x_max
	var r = r_max
	while x > STOP_THRESHHOLD:
		
		# Left
		var tween = _tilt_left(x, r)
		tween.queue_free()
		x *= RECOVERY_FACTOR
		r *= RECOVERY_FACTOR
		
		_recenter()
		
		# Right
		tween = _tilt_right(x, r)
		tween.queue_free()
		x *= RECOVERY_FACTOR
		r *= RECOVERY_FACTOR
		
		_recenter()
		
	emit_signal("tween_completed")

func _tilt_left(x, r) -> Tween:
	var tween = get_tree().create_tween()
	
	# Position
	tween.interpolate_value(
		0, -x,
		TWEEN_DURATION, TWEEN_DURATION, 
		TRANSITION_TYPE, Tween.EASE_OUT
	)
	
	r = -r if pivot_below else r
	tween.interpolate_value(
		0, r,
		TWEEN_DURATION, TWEEN_DURATION,
		TRANSITION_TYPE, Tween.EASE_OUT
	)
	
	tween.start()
	return tween

func _tilt_right(x, r) -> Tween:
	var tween = get_tree().create_tween()
	
	# Position
	tween.interpolate_value(
		0, x,
		TWEEN_DURATION, TWEEN_DURATION, 
		TRANSITION_TYPE, Tween.EASE_OUT
	)
	
	r = r if pivot_below else -r
	tween.interpolate_value(
		0, r,
		TWEEN_DURATION, TWEEN_DURATION,
		TRANSITION_TYPE, Tween.EASE_OUT
	)
	
	tween.start()
	return tween

func _recenter():
	var tween = get_tree().create_tween()
	
	var host_x = host_sprite.position.x
	tween.interpolate_value(
		host_x, 0,
		TWEEN_DURATION, TWEEN_DURATION,
		TRANSITION_TYPE, Tween.EASE_IN
	)
