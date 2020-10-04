extends Node

onready var timer = $work_timer
onready var minute_timer = $minute_timer

var funds = 156
var goal = 500
var work_time = 30
var hours = 8
var has_looped = false


func _on_minute_timer_timeout():
	hours -= 1
	if hours == 0:
		minute_timer.stop()
	else:
		minute_timer.start(3.75)
		signals.emit_signal("update_work_time")


func _on_work_timer_timeout():
	hours = 8
	minute_timer.stop()
	scene_transition.right_in()
	yield(scene_transition.animation_player, "animation_finished")
	scene_transition.right_out()
	get_tree().change_scene("res://scenes/ending.tscn")
