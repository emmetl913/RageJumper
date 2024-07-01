extends Node2D

@onready var has_gem : bool = false
@onready var leaving : bool = false


func _on_area_2d_body_entered(body):
	
	print(has_gem)
	if (has_gem):
		$ExitText.visible = true
		leaving = true
