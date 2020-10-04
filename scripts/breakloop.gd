extends ColorRect


var doubt = false

onready var yes_button = $CenterContainer/VBoxContainer/HBoxContainer/Yes
onready var no_button = $CenterContainer/VBoxContainer/HBoxContainer/No
onready var animation_player = $AnimationPlayer
var messages = [
	"\"Insufficient funds.\"",
	"\"I am too scared.\"",
	"\"Maybe tomorrow will be different.\"",
	"\"But how?\"",
	"\"The loop is not so bad.\"",
	"\"I am not brave enough.\"",
	"\"I am safe in the loop.\"",
	"\"I don't want to!\"",
	"\"I will do it whey you do it!\""
]
var rand = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	player_stats.has_looped = true
	yes_button.grab_focus()
	$Sprite.visible = false
	$Message/Label2.visible = false
	rand.randomize()
	$Message/Label2.text = messages[rand.randi_range(0, messages.size() - 1)]


func _unhandled_input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		if player_stats.has_looped:
			scene_transition.right_in()
			yield(scene_transition.animation_player, "animation_finished")
			scene_transition.right_out()
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://scenes/quit.tscn")
			music.stop_music()
		else:
			if Input.is_action_just_pressed("ui_cancel"):
				get_tree().change_scene("res://scenes/escape_quit.tscn")
	elif doubt:
		scene_transition.right_in()
		yield(scene_transition.animation_player, "animation_finished")
		scene_transition.right_out()
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/introloop.tscn")


#	if player_stats.has_looped:
#		if Input.is_action_just_pressed("ui_cancel"):
#			scene_transition.right_in()
#			yield(scene_transition.animation_player, "animation_finished")
#			scene_transition.right_out()
## warning-ignore:return_value_discarded
#			get_tree().change_scene("res://scenes/quit.tscn")
#			music.stop_music()
#	else:
#		if Input.is_action_just_pressed("ui_cancel"):
#			get_tree().change_scene("res://scenes/escape_quit.tscn")
#	if doubt:
#		scene_transition.right_in()
#		yield(scene_transition.animation_player, "animation_finished")
#		scene_transition.right_out()
## warning-ignore:return_value_discarded
#		get_tree().change_scene("res://scenes/introloop.tscn")
#		player_stats.has_looped = true


func _on_Yes_pressed():
	yes_button.release_focus()
	animation_player.play("animate")
	yield(animation_player, "animation_finished")
	$Sprite.visible = true
	doubt = true


func _on_Yes_focus_entered():
	yes_button.set_text("-yes-")


func _on_Yes_focus_exited():
	yes_button.set_text("yes")
	sfx.play("click", 1, -5)


func _on_No_pressed():
	no_button.release_focus()
	scene_transition.right_in()
	yield(scene_transition.animation_player, "animation_finished")
	scene_transition.right_out()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/introloop.tscn")
	player_stats.has_looped = true


func _on_No_focus_entered():
	no_button.set_text("-no-")


func _on_No_focus_exited():
	no_button.set_text("no")
	sfx.play("click", 1, -5)
