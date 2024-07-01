extends AudioStreamPlayer


const title_music = preload("res://assets/sounds/SlimeTitleTheme.wav")
#https://www.beepbox.co/#9n41s0k9l00e0ft1Ua7g0fj07r1i0o4323T1v1u64f0qwx10u211d08A1F2B5Q20a0Pe64bE3b662776T1v1uc8f10e8q011d23A1F0B2Q2070Pb660E1629T1v1uc5f0q8111d23A0F0B3Q5000Pf800E0T1v1ub4f20o72laq011d23A5F4B3Q0001Pfca8E362963479T3v1uf9f0qwx10l511d08SW86bmhkrrzrkrrrE1b6b0h4y8y0w8h000g4g8w8y00004g0h0h4001400h0g014h4h8ycPcP8wp24CIQu2ajhUepulkhIR_tV5uTmlkhXlZCmSVE-Xo4Qvrd7Th6Pn-pAlpdBXuluhKo1jnUWyK3jbQCFWM4mGza5SXdvQMGpHSNxpBZRCFZTeQmTqpPt5TBMbdvzS5jbNgbweMdArcL4QPCptABAXZdvMqU5d7O8Sqf138WHbVhkzOOeFcLJ3CnxextDyJYofggaqcR09HM1cFbcFlskhKpipEn8FVHCupHyK8YgGGFEG8YxdBDLCmajnE9HPSqcXOdCLaOCkVp82IR9i6hjnmbllkbllkbBnAkRRyRll2w
const level_music = preload("res://assets/sounds/SlimeLevelTheme.wav")

var current_song


var prev_music_progress = [0.0, 0.0]
#0 = SlimeTitle
#1 = SlimeThemeSlow


func play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	stream = music
	volume_db = volume

func play_music_title():
	if stream == title_music:
		return
	#save level music progress
	#prev_music_progress[1] = get_playback_position()
	current_song = title_music
	stream = current_song
	play(prev_music_progress[0])
	volume_db = -5
func play_music_level():
	if stream == level_music:
		return
	#save title music progress
	prev_music_progress[0] = get_playback_position()
	current_song = level_music
	stream = current_song
	play()
	volume_db = -5

func _on_finished():
	stream = current_song
	play()
	
