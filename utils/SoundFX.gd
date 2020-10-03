extends Node

var sounds_path = "res://Audio/SFX/"

var sounds = {
	"Bullet" : load(sounds_path + "bullet.wav"),
	"Explosion" : load(sounds_path + "explosion.wav"),
	"Hurt" : load(sounds_path + "hurt.wav"),
	"Melee" : load(sounds_path + "melee.wav")
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
