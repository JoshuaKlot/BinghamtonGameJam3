extends Control
#@onready var  player = %Player
func _on_item_1_button_pressed() -> void:
	print(Roomvar.roomNumber)
	if Roomvar.roomNumber == 0:
		get_tree().change_scene_to_file("res://scenes/room2.tscn")
		Roomvar.roomNumber=1
		
	elif Roomvar.roomNumber == 1:
		get_tree().change_scene_to_file("res://scenes/room3.tscn")
		Roomvar.roomNumber=2
	elif Roomvar.roomNumber == 2:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_item_2_button_pressed() -> void:
	print(Roomvar.roomNumber)
	if Roomvar.roomNumber == 0:
		get_tree().change_scene_to_file("res://scenes/room2.tscn")
		Roomvar.roomNumber=1
		
	elif Roomvar.roomNumber == 1:
		get_tree().change_scene_to_file("res://scenes/room3.tscn")
		Roomvar.roomNumber=2
	elif Roomvar.roomNumber == 2:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
func _on_item_3_button_pressed() -> void:
	print(Roomvar.roomNumber)
	if Roomvar.roomNumber == 0:
		get_tree().change_scene_to_file("res://scenes/room2.tscn")
		Roomvar.roomNumber=1
		
	elif Roomvar.roomNumber == 1:
		get_tree().change_scene_to_file("res://scenes/room3.tscn")
		Roomvar.roomNumber=2
	elif Roomvar.roomNumber == 2:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		
func _on_quit_pressed() -> void:
	get_tree().quit()
