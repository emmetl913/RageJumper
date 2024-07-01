extends Node2D

var url = "http://dreamlo.com/lb/66816abf8f40bb0990005e33/json"
var sendScore = "http://dreamlo.com/lb/sPdQfXjMvkKdnrQplZ5qQg4Feu7KY53UG4gq0Jw1u_rw/add/Gerrad/15/50/501"

@onready var http_req = $HTTPRequest

#Each level should have an array of structs that hold names and times in order
#We add the scores to each level based off their level index 
func _ready():
	send_request()
	# Example POST request
	var post_data = {"name": "NewPlayer", "score": "15", "seconds": "45", "text": "59", "date": "6/30/2024 2:50:00 PM"}
	send_post_request(url, post_data)

func send_get_request():
	var headers = ["Content-Type: application/json"]
	http_req.request(url, headers, HTTPClient.METHOD_GET)

func send_post_request(url, data):
	var json_data = JSON.stringify(data)
	var headers = ["Content-Type: application/json"]
	http_req.request(url, headers, HTTPClient.METHOD_POST, json_data)

func send_request():
	var headers = ["Content-type: application/json"]
	http_req.request(url, headers, HTTPClient.METHOD_GET)
	$HTTPRequest.request(sendScore, headers, HTTPClient.METHOD_POST)
	#http_req.resp

func _on_http_request_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json["dreamlo"]["leaderboard"]["entry"])
	var entries = json["dreamlo"]["leaderboard"]["entry"]
	for entry in entries:
		var name = entry["name"]
		var minutes = entry["score"]
		var seconds = entry["seconds"]
		var mslvl = entry["text"]
		var levelindex = mslvl.substr(2, mslvl.length())
		var ms = mslvl.substr(0, 2)
		print("Name: ", name, ", ", "Minutes: ", minutes, ", ", "Seconds: ", seconds, ", ", "Miliseconds: ", ms, " Level#: ", levelindex)
	

#func upload_score():
	#http_req.request(sendScore, headers, HTTPClient.METHOD_POST)


#first num after username is minutes then / seconds / miliseconds(lvlIndex) 
#ANY DIGITS PAST THE FIRST TWO OF MILISECONDS ARE THE LEVEL INDEX (12 would be world 1 level 2) (36 would be world 3-levl6)
#http://dreamlo.com/lb/sPdQfXjMvkKdnrQplZ5qQg4Feu7KY53UG4gq0Jw1u_rw/add/Carmine/12/32/592
#so this would enter player Carmine with 12 minutes, 32 seconds, 59 ms LEVEL, 2

