extends ColorRect


var doubt = false

onready var yes_button = $CenterContainer/VBoxContainer/HBoxContainer/Yes
onready var no_button = $CenterContainer/VBoxContainer/HBoxContainer/No
onready var animation_player = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	yes_button.grab_focus()


func _unhandled_input(_event):
	if doubt:
		scene_transition.right_in()
		yield(scene_transition.animation_player, "animation_finished")
		scene_transition.right_out()
		get_tree().change_scene("res://scenes/intro.tscn")


func _on_Yes_pressed():
	yes_button.release_focus()
	animation_player.play("animate")
	yield(animation_player, "animation_finished")
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
	get_tree().change_scene("res://scenes/bedroom.tscn")


func _on_No_focus_entered():
	no_button.set_text("-no-")


func _on_No_focus_exited():
	no_button.set_text("no")
	sfx.play("click", 1, -5)
