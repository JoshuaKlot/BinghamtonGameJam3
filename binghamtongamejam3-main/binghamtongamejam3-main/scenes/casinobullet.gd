extends CharacterBody2D


var SPEED = 300.0
@onready var player = $root/Main/%Player
#var direction = global_position.direction_to(player.global_position)


func _physics_process(delta: float) -> void:
	velocity=Vector2.DOWN*SPEED

	move_and_slide()
func _on_area_2d_area_entered(area: Area2D) -> void:
	queue_free()
