extends Control

onready var day = $Day/Day
onready var funds = $Funds/Funds


func _ready():
	update_stats_bar()


func update_stats_bar():
	day.set_text("Day:" + str(player_stats.day))
	funds.set_text("$" + str(player_stats.funds) + "/" + "$" + str(player_stats.goal))
