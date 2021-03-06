extends Control

onready var work_time = $Hour/Hour
onready var funds = $Funds/Funds


func _ready():
	update_stats_bar()
# warning-ignore:return_value_discarded
	signals.connect("update_work_time", self, "on_update_work_time")
	if get_parent().get_parent().is_in_group("work"):
		$Hour/Day.visible = false
		work_time.visible = true
		if player_stats.timer.is_stopped():
			player_stats.timer.start(30)
			player_stats.minute_timer.start(3.75)
	else:
		$Hour/Day.visible = true
		work_time.visible = false


func update_stats_bar():
	work_time.set_text("WORK HOURS LEFT:" + str(player_stats.hours))
	funds.set_text("RETIREMENT FUNDS: $" + str(player_stats.funds) + "k / " + "$" + str(player_stats.goal) + "k")


func on_update_work_time():
	update_stats_bar()
