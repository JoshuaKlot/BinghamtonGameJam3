extends Control


func _on_item_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/room2.tscn")
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
