extends Node2D

@onready var leaving : bool = false

@onready var level = get_parent()

func _on_area_2d_body_entered(body):
	if level.player_gem_count >= level.number_of_gems_in_level:
		$ExitText.visible = true
		leaving = true
