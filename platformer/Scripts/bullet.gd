extends CharacterBody2D

var direction = Vector2.ZERO
const bulletSpeed = 300.0
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
	if area.name == "Walls":
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	print (body.name)
