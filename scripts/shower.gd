extends Sprite
class_name Shower


func _ready():
	$AnimationPlayer.play("active")


func play_shower_sound():
	sfx.play("shower", rand_range(0.8, 1.2), -15)


func _on_Area2D_body_entered(_body):
	signals.emit_signal("enter_shower")


func _on_Area2D_body_exited(_body):
	signals.emit_signal("exit_shower")
