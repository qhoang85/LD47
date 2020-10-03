extends ColorRect

onready var day = $Day
onready var funds = $Funds


func _ready():
	update_top_bar()


func update_top_bar():
	day.set_text("Day:" + str(player_stats.day))
	funds.set_text("$" + str(player_stats.funds) + "/" + "$" + str(player_stats.goal))
