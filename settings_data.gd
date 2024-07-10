extends Node


var save_path = "user://settings_data.save"
@export var volume: int

# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()


func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(volume)
	
	file.close()

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		volume = file.get_var()
		file.close()
	print("Settings loaded:  \n Volume: ", volume)
