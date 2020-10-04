extends ColorRect


onready var animation_player =$AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _unhandled_input(_event):
	if player_stats.has_looped:
		if Input.is_action_just_pressed("ui_cancel"):
			scene_transition.right_in()
			yield(scene_transition.animation_player, "animation_finished")
			scene_transition.right_out()
			get_tree().change_scene("res://scenes/quit.tscn")
			music.stop_music()
	
	if not animation_player.is_playing():
		scene_transition.right_in()
		yield(scene_transition.animation_player, "animation_finished")
		scene_transition.right_out()
		get_tree().change_scene("res://scenes/bedroom.tscn")
