extends CharacterBody2D

var direction=Vector2(0,0)
const bulletSpeed=300.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	velocity.x=direction.x*bulletSpeed
	velocity.y=direction.y*bulletSpeed
