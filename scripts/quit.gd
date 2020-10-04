extends Control

var end_trig = false

onready var animation_player = $AnimationPlayer
onready var indicator = $next_indicator


func _ready():
	$Sprite.frame = 0
	indicator.visible = false
	$Text/Label.percent_visible = 0
	$Text/Label2.percent_visible = 0
	$Text/Label3.percent_visible = 0


func _unhandled_input(_event):
	if end_trig:
		get_tree().quit()


func twist():
	$Sprite.frame = 1
	sfx.play("chill")


func end_triggered():
	end_trig = true
	indicator.visible = true
