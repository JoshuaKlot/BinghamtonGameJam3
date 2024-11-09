extends CharacterBody2D

var damage = 1
const SPEED = 100.0
const JUMP_VELOCITY = -400.0
const bullet_speed = 300.0
@onready var _animated_sprite = $AnimatedSprite2D
var lastdirection = Vector2.DOWN

func _physics_process(delta: float) -> void:
	var bullet = preload("res://scenes/bullet.tscn")
	var main = get_node("bulletContainer")
	look_at(get_global_mouse_position())
	

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
		_animated_sprite.play("Walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		_animated_sprite.play("Idle")

	move_and_slide()
