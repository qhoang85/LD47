extends Node2D

enum ending{DOCTOR, ROBBER, JUDGE}
var end_mode

onready var buttons = $Buttons
onready var home_button = $Buttons/Home
onready var doctor = $ending_doctor
onready var robber = $ending_robber
onready var judge = $ending_judge
onready var animation_player = $AnimationPlayer


func _ready():
	randomize()
	end_mode = ending.values()[(randi() % ending.size())]
	buttons.visible = false
	
	match end_mode:
		ending.DOCTOR:
			doctor.visible = true
			robber.visible = false
			judge.visible = false
			animation_player.play("doctor")
		ending.ROBBER:
			doctor.visible = false
			robber.visible = true
			judge.visible = false
			animation_player.play("robber")
		ending.JUDGE:
			doctor.visible = false
			robber.visible = false
			judge.visible = true
			animation_player.play("judge")


func _unhandled_input(_event):
	if player_stats.has_looped:
		if Input.is_action_just_pressed("ui_cancel"):
			scene_transition.right_in()
			yield(scene_transition.animation_player, "animation_finished")
			scene_transition.right_out()
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://scenes/quit.tscn")
			music.stop_music()


func set_buttons_visible():
	buttons.visible = true
	home_button.grab_focus()
	$Timer.start()
	sfx.play("click", 1, -5)


func _on_Home_pressed():
	if $Timer.is_stopped():
		player_stats.funds += -89
		scene_transition.right_in()
		yield(scene_transition.animation_player, "animation_finished")
		scene_transition.right_out()
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/bedroom_night.tscn")


func _on_Home_focus_entered():
	home_button.set_text("-go home-")


func _on_Home_focus_exited():
	home_button.set_text("go home")
	sfx.play("click", 1, -5)


#func _on_Quit_pressed():
#	if $Timer.is_stopped():
#		quit_button.release_focus()
#		end.visible = true
#		end.animation_player.play("Animate")
#		music.stop_music()
#
#
#func _on_Quit_focus_entered():
#	quit_button.set_text("-quit-")
#
#
#func _on_Quit_focus_exited():
#	quit_button.set_text("quit")
#	sfx.play("click", 1, -5)
