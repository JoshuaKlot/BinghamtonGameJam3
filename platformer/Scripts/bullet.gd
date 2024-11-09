extends CharacterBody2D

var direction = Vector2.ZERO
const bulletSpeed = 300.0

func _physics_process(delta: float) -> void:
    velocity = direction * bulletSpeed
    move_and_slide()
