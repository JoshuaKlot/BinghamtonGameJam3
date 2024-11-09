extends CharacterBody2D

var direction=1
var direction2=0
const bulletSpeed=300.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var direction := -Input.get_axis("ui_left", "ui_right")
	var direction2 := -Input.get_axis("ui_up", "ui_down")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	velocity.x=direction*bulletSpeed
	velocity.y=direction2*bulletSpeed
