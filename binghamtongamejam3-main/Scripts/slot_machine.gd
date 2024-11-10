extends Area2D

@onready var player = %Player
var rolling = true
# Called when the node enters the scene tree for the first time.
var bullet = preload("res://scenes/casinobullet.tscn")
var HEALTH = 5

func _ready() -> void:
	$AnimatedSprite2D.play("rolling")
	$RollTimer.start()
	add_to_group("enemy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $RollTimer.time_left==0 and rolling:
		$AnimatedSprite2D.play("winner")
		$FireTimer.start()
		rolling=false
		var instance = bullet.instantiate()
		get_parent().add_child(instance)
		instance.global_position = global_position
		instance.rotation = rotation
		
	if $FireTimer.time_left==0 and not rolling:
		$AnimatedSprite2D.play("rolling")
		$RollTimer.start()
		rolling = true
	if HEALTH <= 0:
		queue_free()


func take_damage():
	print(player.damage)
	HEALTH = HEALTH - player.damage
