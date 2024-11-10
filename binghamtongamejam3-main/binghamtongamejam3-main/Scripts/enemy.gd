extends CharacterBody2D

@onready var player = %Player
var SPEED = 65

var HEALTH = 5

func _ready():
	add_to_group("enemy")

func _physics_process(delta: float) -> void:
	if(player != null):
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * SPEED
	move_and_slide()



func _process(delta: float) -> void:
	if HEALTH <= 0:
		queue_free()


func take_damage():
	print(player.damage)
	HEALTH = HEALTH - player.damage



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().has_method("damage_taken"):
		area.get_parent().damage_taken()