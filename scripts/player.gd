extends KinematicBody2D
class_name Player


export(float) var speed = 20.0
var _input : Vector2
var _look_dir = 1.0
var _is_using = false
export(bool) var is_reflection = false


func _physics_process(delta):
	self._move(delta)


func _process(delta):
	self._process_input()


func _sign(x):
	if x >= 0.0:
		return 1
	return -1


func _process_input():
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


func _move(delta : float):
	if self._input.length() > 0.0:
		self._input = self._input.normalized()
		$AnimationPlayer.play("walk")
		var movement = self.move_and_slide(self._input * self.speed)
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
