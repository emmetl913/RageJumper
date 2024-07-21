extends Node

var save_path = "user://variable.save"
var GLOBAL_WORLD_INDEX : int

#index 0 is the tutorial -- Save times for world 1
@export var bestmin = [0,0,0,0,0,0,0]
@export var bestsec = [0,0,0,0,0,0,0]
@export var bestmsec = [0,0,0,0,0,0,0]
# Save times for world 2
@export var bestmin2 = [0,0,0,0,0,0]
@export var bestsec2 = [0,0,0,0,0,0]
@export var bestmsec2 = [0,0,0,0,0,0]

const LEVEL_COUNT = 6
const WORLD_COUNT = 2

#TODO: Make array of bestmin, bestsec, bestmsec for each level. (0th index would be level1-1, 1st = lvl1-2)
#Load proper array index for displaying besttimes

func _ready():
	load_data()
	print_save_data()
	print("loaded data")
func save(wrldindex:int, lvlindex :int, minutes: int, seconds:int, msec :int):
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	print("mins: ", minutes,  " sec: ", seconds, " ms: ", msec)
	bestmin[lvlindex] = minutes
	bestsec[lvlindex] = seconds
	bestmsec[lvlindex] = msec
	for i in range(LEVEL_COUNT):
		if wrldindex == 1:
			file.store_var(bestmin[i])
			file.store_var(bestsec[i])
			file.store_var(bestmsec[i])
		elif wrldindex == 2:
			file.store_var(bestmin2[i])
			file.store_var(bestsec2[i])
			file.store_var(bestmsec2[i])
	file.close()

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		for j in range(WORLD_COUNT):
			for i in range(LEVEL_COUNT):
				if WORLD_COUNT == 1:
					bestmin[i] = file.get_var()
					bestsec[i] = file.get_var()
					bestmsec[i] = file.get_var()
				elif WORLD_COUNT == 2:
					bestmin2[i] = file.get_var()
					bestsec2[i] = file.get_var()
					bestmsec2[i] = file.get_var()
		file.close()

func print_save_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		for i in range(LEVEL_COUNT):
			print("Level", i, ":", file.get_var(), "min", file.get_var(), "sec", file.get_var(), "msec")
		file.close()
	else:
		print("Save file does not exist")
