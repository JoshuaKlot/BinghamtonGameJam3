extends CharacterBody2D


var SPEED = 300.0
var xValue=randf_range(-1,1)
var yValue=randf_range(-1,1)

func _physics_process(delta: float) -> void:

	velocity=Vector2(xValue,yValue)*SPEED
	move_and_slide()
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	queue_free()
