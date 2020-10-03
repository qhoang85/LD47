extends Control

onready var start_button = $VBoxContainer/Start
onready var howto_button = $VBoxContainer/HowTo
onready var quit_button = $VBoxContainer/Quit
onready var credit_button = $VBoxContainer/Credit
onready var background = $Background
onready var pointer = $Arm
onready var credit_menu = $Credit
onready var credit_back_button = $Credit/CenterContainer/VBoxContainer/Back
onready var howto_menu = $HowTo
onready var howto_back_button = $HowTo/CenterContainer/VBoxContainer/Back

func _ready():
	start_button.grab_focus()
	background.frame = 0
	music.play_song("song01")


func _on_Start_pressed():
	player_stats.reset_stats()
	sfx.play("click", 1, -5)


func _on_HowTo_pressed():
	howto_menu.visible = true
	howto_back_button.grab_focus()


func _on_Quit_pressed():
	get_tree().quit()


func _on_Credit_pressed():
	credit_menu.visible = true
	credit_back_button.grab_focus()


func _on_Start_focus_entered():
	start_button.set_text("-start-")
	pointer.rotation_degrees = -5
	background.frame = 0


func _on_Start_focus_exited():
	start_button.set_text("start")
	sfx.play("click", 1, -5)


func _on_HowTo_focus_entered():
	howto_button.set_text("-how to play-")
	pointer.rotation_degrees = -10
	background.frame = 1


func _on_HowTo_focus_exited():
	howto_button.set_text("how to play")
	sfx.play("click", 1, -5)


func _on_HowTo_Back_pressed():
	howto_menu.visible = false
	howto_button.grab_focus()


func _on_HowTo_Back_gui_input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		howto_menu.visible = false
		howto_button.grab_focus()


func _on_HowTo_Back_focus_exited():
	sfx.play("click", 1, -5)


func _on_Quit_focus_entered():
	quit_button.set_text("-quit-")
	pointer.rotation_degrees = -20
	background.frame = 2


func _on_Quit_focus_exited():
	quit_button.set_text("quit")
	sfx.play("click", 1, -5)


func _on_Credit_focus_entered():
	credit_button.set_text("-by assface-")
	pointer.rotation_degrees = 23
	background.frame = 3


func _on_Credit_focus_exited():
	credit_button.set_text("by assface")
	sfx.play("click", 1, -5)


func _on_Credit_Back_pressed():
	credit_menu.visible = false
	credit_button.grab_focus()


func _on_Credit_Back_gui_input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		credit_menu.visible = false
		credit_button.grab_focus()


func _on_Credit_Back_focus_exited():
	sfx.play("click", 1, -5)
