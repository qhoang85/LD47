extends Node

var songs_path = "res://audio/music/"

var songs = {
	"song01" : load(songs_path + "megupets - haran(cc0).ogg"),
	"song02" : load(songs_path + "megupets - sosten(cc0).ogg"),
	"song03" : load(songs_path + "spring - im_pathetica(cc0).ogg"),
}

onready var musicPlayer = $AudioStreamPlayer

func play_song(song_string, pitch_scale = 1, volume_db = 0):
	musicPlayer.stream = songs[song_string]
	musicPlayer.pitch_scale = pitch_scale
	musicPlayer.volume_db = volume_db
	musicPlayer.play()

func pause_music():
	musicPlayer.stream_paused = true

func unpause_music():
	musicPlayer.stream_paused = false

func stop_music():
	musicPlayer.stop()
