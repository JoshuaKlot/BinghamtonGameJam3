extends Area2D

var rolling = true
# Called when the node enters the scene tree for the first time.
var bullet = preload("res://scenes/casinobullet.tscn")

func _ready() -> void:
	$AnimatedSprite2D.play("rolling")
	$RollTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $RollTimer.time_left==0 and rolling:
		$AnimatedSprite2D.play("winner")
		$FireTimer.start()
		rolling=false
		var instance = bullet.instantiate()
		get_tree().root.main.add_child(instance)
		instance.global_position = global_position
		instance.rotation = rotation
		
	if $FireTimer.time_left==0 and not rolling:
		$AnimatedSprite2D.play("rolling")
		$RollTimer.start()
		rolling = true
	
