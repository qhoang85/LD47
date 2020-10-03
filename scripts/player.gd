extends Node2D
class_name Player


export(float) var speed = 20.0
var _input : Vector2
var _look_dir = 1.0


func _process(delta):
	self._process_input()
	self._move(delta)


func _sign(x):
	if x >= 0.0:
		return 1
	return -1


func _process_input():
	self._input = Vector2(0.0, 0.0)
	if Input.is_action_pressed("player_up"):
		self._input.y -= 1.0
	if Input.is_action_pressed("player_down"):
		self._input.y += 1.0
	if Input.is_action_pressed("player_left"):
		self._input.x -= 1.0
	if Input.is_action_pressed("player_right"):
		self._input.x += 1.0


func _move(delta : float):
	if self._input.length() > 0.0:
		self._input = self._input.normalized()
		$AnimationPlayer.play("walk")
		var movement = $KinematicBody2D.move_and_slide(self._input * delta * self.speed)
		self.global_position += movement
		if self._input.x != 0.0:
			if self._sign(self._input.x) != self._sign(self._look_dir):
				self._look_dir = self._sign(self._input.x)
				$Sprite.scale.x = self._look_dir
	else:
		$AnimationPlayer.play("idle")
