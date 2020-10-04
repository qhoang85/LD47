extends Node2D


onready var buttons = $CenterContainer
onready var home_button = $CenterContainer/Home
onready var quit_button = $CenterContainer/Quit
onready var end = $End


func _ready():
	buttons.visible = false
	end.visible = false


func set_buttons_visible():
	buttons.visible = true
	home_button.grab_focus()
	sfx.play("click", 1, -5)


func _on_Home_pressed():
	pass # Replace with function body.


func _on_Home_focus_entered():
	home_button.set_text("-go home-")


func _on_Home_focus_exited():
	home_button.set_text("go home")
	sfx.play("click", 1, -5)


func _on_Quit_pressed():
	quit_button.release_focus()
	end.visible = true
	end.animation_player.play("Animate")


func _on_Quit_focus_entered():
	quit_button.set_text("-quit-")


func _on_Quit_focus_exited():
	quit_button.set_text("quit")
	sfx.play("click", 1, -5)
