extends Node

onready var timer = $work_timer
onready var minute_timer = $minute_timer

var funds = 156
var goal = 500
var work_time = 30
var hours = 8


func reset_stats():
	funds = 156
	goal = 500
	work_time = 30
	hours = 8


func start_work_time():
	timer.start()
	minute_timer.start()


func _on_minute_timer_timeout():
	if hours == 0:
		minute_timer.stop()
	else:
		hours -= 1
		signals.emit_signal("update_work_time")


func _on_work_timer_timeout():
	scene_transition.right_in()
	yield(scene_transition.animation_player, "animation_finished")
	scene_transition.right_out()
	get_tree().change_scene("res://scenes/ending.tscn")
