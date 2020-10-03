extends Control

onready var start_button = $VBoxContainer/Start
onready var howto_button = $VBoxContainer/HowTo
onready var quit_button = $VBoxContainer/Quit
onready var pointer = $Pointer

func _ready():
	start_button.grab_focus()


func _process(_delta):
	pass


func _on_Start_pressed():
	pass # Replace with function body.


func _on_HowTo_pressed():
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit()


func _on_Start_focus_entered():
	start_button.set_text("-start-")
	pointer.rotation_degrees = -5


func _on_Start_focus_exited():
	start_button.set_text("start")



func _on_HowTo_focus_entered():
	howto_button.set_text("-how to play-")
	pointer.rotation_degrees = -10


func _on_HowTo_focus_exited():
	howto_button.set_text("how to play")


func _on_Quit_focus_entered():
	quit_button.set_text("-quit-")
	pointer.rotation_degrees = -20


func _on_Quit_focus_exited():
	quit_button.set_text("quit")
