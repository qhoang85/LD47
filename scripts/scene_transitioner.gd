extends Area2D
class_name SceneTransitioner

export(String, FILE, "*.tscn") var scene_path


func _on_body_entered(body):
	get_tree().change_scene(scene_path)
