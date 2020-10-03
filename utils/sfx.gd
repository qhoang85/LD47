extends Node

var sounds_path = "res://audio/sfx/"

var sounds = {
	"bullet" : load(sounds_path + "bullet.wav"),
	"explosion" : load(sounds_path + "explosion.wav"),
	"click" : load(sounds_path + "click.wav"),
	"hurt" : load(sounds_path + "hurt.wav"),
	"melee" : load(sounds_path + "melee.wav"),
	"step" : load(sounds_path + "step.wav")
}

onready var sound_players = get_children()

func play(sound_string, pitch_scale = 1, volume_db = 0):
	for soundPlayer in sound_players:
		if not soundPlayer.playing:
			soundPlayer.pitch_scale = pitch_scale
			soundPlayer.volume_db = volume_db
			soundPlayer.stream = sounds[sound_string]
			soundPlayer.play()
			return
