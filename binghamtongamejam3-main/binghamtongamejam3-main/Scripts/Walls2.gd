extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_open() -> void:
	$CollisionShape2D6.disabled = true
	#print("OpenSTATIC")

func take_damage():
	pass

func damage_taken():
	pass
