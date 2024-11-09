extends CharacterBody2D


const SPEED = 70.0
var direction=Vector2(1,-1)
	
func _ready() -> void:
	$AnimatedSprite2D.play("default")

func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.look_at(direction)
	velocity=direction*SPEED
	if $Bottom.is_colliding():
		direction.y=-1
	if $Left.is_colliding():
		direction.x=1
	if $Top.is_colliding():
		direction.y=1
	if $Right.is_colliding():
		direction.x=-1
	move_and_slide()
