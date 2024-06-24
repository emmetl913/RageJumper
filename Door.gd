extends Node2D

@onready var has_gem : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print("pee pee")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	print("ponis")
	print(has_gem)
	if (has_gem):
		$ExitText.visible = true
