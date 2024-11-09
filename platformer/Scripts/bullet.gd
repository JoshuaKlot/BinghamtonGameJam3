extends CharacterBody2D

var direction = Vector2.ZERO
const bulletSpeed = 300.0

func _ready() -> void:
	var timer = get_node("Timer")
	if timer:
		timer.start()
	else:
		print("Timer not found")

func _physics_process(delta: float) -> void:
	velocity = direction * bulletSpeed
	move_and_slide()

func _on_Timer_timeout() -> void:
	queue_free()
