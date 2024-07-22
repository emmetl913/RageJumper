extends Node

var save_path = "user://variable.save"
var GLOBAL_WORLD_INDEX : int
var index

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
	print("wlrd: ", wrldindex ," mins: ", minutes,  " sec: ", seconds, " ms: ", msec)
	if(wrldindex == 1):
		bestmin[lvlindex] = minutes
		bestsec[lvlindex] = seconds
		bestmsec[lvlindex] = msec
		print("Data about to be save WRLD1: ", bestmin[lvlindex], " : ", bestsec[lvlindex], " : ", bestmsec[lvlindex])
	elif(wrldindex == 2):
		bestmin2[lvlindex] = minutes
		bestsec2[lvlindex] = seconds
		bestmsec2[lvlindex] = msec
		print("Data about to be save WRLD2: ", bestmin2[lvlindex], " : ", bestsec2[lvlindex], " : ", bestmsec2[lvlindex])
	for j in range(WORLD_COUNT):
		for i in range(LEVEL_COUNT):
			if j == 0:
				file.store_var(bestmin[i])
				file.store_var(bestsec[i])
				file.store_var(bestmsec[i])
				print("Data saved to world 2 for 1:", i)
			elif j == 1:
				file.store_var(bestmin2[i])
				file.store_var(bestsec2[i])
				file.store_var(bestmsec2[i])
				print("Data saved to world 2 for 2:", i)
	file.close()

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		for j in range(WORLD_COUNT):
			index = 1
			for i in range(LEVEL_COUNT):
				if j == 0:
					print("World 1 currently loading... 1:", index)
					bestmin[i] = file.get_var()
					bestsec[i] = file.get_var()
					bestmsec[i] = file.get_var()
					print("Time: ", bestmin[i], " : ", bestsec[i]," : ", bestmsec[i])
					index += 1
				elif j == 1:
					print("World 2 currently loading... 2:", index)
					bestmin2[i] = file.get_var()
					bestsec2[i] = file.get_var()
					bestmsec2[i] = file.get_var()
					print("Time: ", bestmin2[i], " : ", bestsec2[i]," : ", bestmsec2[i])
					index += 1
		file.close()

func print_save_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		for i in range(LEVEL_COUNT):
			print("Level", i, ":", file.get_var(), "min", file.get_var(), "sec", file.get_var(), "msec")
		file.close()
	else:
		print("Save file does not exist")
