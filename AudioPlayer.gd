extends AudioStreamPlayer

const title_music = preload("res://assets/sounds/SlimeTitleTheme.wav")
const level_music = preload("res://assets/sounds/SlimeThemeSlow.wav")

var current_song

func play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	play()

func play_music_title():
	play_music(title_music, -9.0)
	current_song = title_music
func play_music_level():
	play_music(level_music, -9.0)
	current_song = level_music


func _on_finished():
	stream = current_song
	play()
	
