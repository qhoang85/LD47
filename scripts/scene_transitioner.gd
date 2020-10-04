extends Area2D
class_name SceneTransitioner

export(String, FILE, "*.tscn") var scene_path


func _on_body_entered(body):
	scene_transition.right_in()
	yield(scene_transition.animation_player, "animation_finished")
	scene_transition.right_out()
	get_tree().change_scene(scene_path)
