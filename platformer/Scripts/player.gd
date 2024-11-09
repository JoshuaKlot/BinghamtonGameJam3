extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0
const bullet_speed = 300.0

var lastdirection = Vector2.DOWN

func _physics_process(delta: float) -> void:
	var bullet = preload("res://scenes/bullet.tscn")
	var main = get_node("bulletContainer")
	look_at(get_global_mouse_position())
	
	rotation_degrees = wrap(rotation_degrees,0,360)
	if rotation_degrees > 90 and rotation_degrees <270:
		scale.y = -1
	else:
			scale.y = 1
	if Input.is_action_just_pressed("shoot"):
		var instance = bullet.instantiate()
		get_tree().root.add_child(instance)
		instance.global_position = global_position
		instance.rotation = rotation

	var direction := Input.get_axis("ui_left", "ui_right")
	var direction2 := Input.get_axis("ui_up", "ui_down")

	if direction or direction2:
		velocity.x = direction * SPEED
		velocity.y = direction2 * SPEED
		lastdirection = Vector2(direction, direction2).normalized()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()