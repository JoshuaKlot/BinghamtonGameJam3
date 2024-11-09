extends CharacterBody2D

@onready var player = %Player
var SPEED = 100

var HEALTH=5

func _ready() -> void:
	$AnimatedSprite2D.play("default")
func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	look_at(direction)
	move_and_slide()
	


func _process(delta: float) -> void:
	if HEALTH == 0:
		queue_free()


func take_damage():
	print(player.damage)
	HEALTH = HEALTH - player.damage
