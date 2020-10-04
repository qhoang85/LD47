extends CanvasLayer


onready var black = $Black
onready var animation_player = $AnimationPlayer


func _ready():
	pass # Replace with function body.


func right_in():
	animation_player.play("right_in")


func right_out():
	animation_player.play("right_out")
