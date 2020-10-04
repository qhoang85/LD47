extends KinematicBody2D
class_name Player


export(float) var speed = 20.0
var _input : Vector2
var _look_dir = 1.0
var _is_using = false
export(bool) var is_reflection = false
var _is_showering = 0
export(bool) var disable_motion_reset = false


func _ready():
# warning-ignore:return_value_discarded
	signals.connect("enter_shower", self, "take_shower")
# warning-ignore:return_value_discarded
	signals.connect("exit_shower", self, "finish_shower")


func _unhandled_input(_event):
	if player_stats.has_looped:
		if Input.is_action_just_pressed("ui_cancel"):
			scene_transition.right_in()
			yield(scene_transition.animation_player, "animation_finished")
			scene_transition.right_out()
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://scenes/quit.tscn")
			music.stop_music()


func _physics_process(delta):
	self._move(delta)


# warning-ignore:unused_argument
func _process(delta):
	self._process_input()


func _sign(x):
	if x >= 0.0:
		return 1
	return -1


func _process_input():
	if !self.disable_motion_reset:
		self._input = Vector2(0.0, 0.0)
	self._is_using = false
	if Input.is_action_pressed("player_use"):
		self._is_using = true
		return
	if Input.is_action_pressed("player_up"):
		if !self.is_reflection:
			self._input.y -= 1.0
		else:
			self._input.y += 1.0
	if Input.is_action_pressed("player_down"):
		if !self.is_reflection:
			self._input.y += 1.0
		else:
			self._input.y -= 1.0
	if Input.is_action_pressed("player_left"):
		self._input.x -= 1.0
	if Input.is_action_pressed("player_right"):
		self._input.x += 1.0


# warning-ignore:unused_argument
func _move(delta : float):
	var is_moving = false
	if self._input.length() > 0.0:
		self._input = self._input.normalized()
		is_moving = true
		self._input = self.move_and_slide(self._input * self.speed)
	
	if self._is_showering > 0:
		$AnimationPlayer.play("shower")
	elif is_moving:
		$AnimationPlayer.play("walk")
		if self._input.x != 0.0:
			if self._sign(self._input.x) != self._sign(self._look_dir):
				self._look_dir = self._sign(self._input.x)
				$Sprite.scale.x = self._look_dir
	elif self._is_using == false:
		$AnimationPlayer.play("idle")
	else:
		$AnimationPlayer.play("use")


func play_walk_sfx():
	if !self.is_reflection:
		sfx.play("step", rand_range(0.8, 1.2), -10)


func play_shower_sound():
	if !self.is_reflection:
		sfx.play("shower", rand_range(0.8, 1.2), -15)
		

func take_shower():
	self._is_showering = self._is_showering + 1
	
	
func finish_shower():
	self._is_showering = self._is_showering - 1


func play_skate_sound():
	if !self.is_reflection:
		sfx.play("skate")
