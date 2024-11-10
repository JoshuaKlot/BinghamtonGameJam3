extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Entered Collision")
		get_tree().change_scene_to_file("res://scenes/move_menu.tscn")
		#pass # Replace with function body.
