extends Node

var save_path = "user://variable.save"

@export var bestmin : int
@export var bestsec : int
@export var bestmsec : int


func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(bestmin)
	file.store_var(bestsec)
	file.store_var(bestmsec)

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		bestmin = file.get_var()
		bestsec = file.get_var()
		bestmsec = file.get_var()
