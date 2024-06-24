extends Node2D

var player_has_gem

# Called when the node enters the scene tree for the first time.
func _ready():
	player_has_gem = false
	$SacredGemSprite.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_sacred_gem_area_body_entered(body):
	if (body.is_in_group("Player")):
		print(body.name)
		player_has_gem = true
		$SacredGemSprite.visible = false
