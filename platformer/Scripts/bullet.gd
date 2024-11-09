extends CharacterBody2D

var direction = Vector2.ZERO
const bulletSpeed = 300.0
func _ready() -> void:
	look_at(get_viewport().get_mouse_position())

func _physics_process(delta: float) -> void:
	velocity = Vector2(1, 1).rotated(rotation) * bulletSpeed
	move_and_slide()
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		queue_free()
	
