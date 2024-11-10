extends CharacterBody2D

const bulletSpeed = 200.0
func _ready() -> void:
	look_at(get_viewport().get_mouse_position())

func _physics_process(delta: float) -> void:
	velocity = Vector2(1, 0).rotated(rotation) * bulletSpeed
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	#when it hits another area2d (enemy's)
	#enemy takes damage
	if area.get_parent().has_method("take_damage"):
		area.get_parent().take_damage()
		queue_free()
	if area.get_parent().has_method("damage_taken"): 
		pass
	else:
		queue_free()
