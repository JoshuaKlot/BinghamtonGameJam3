extends Area2D
signal open
var counter = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#counter = get_tree().get_nodes_in_group("enemy").size()
	#print(counter)
	pass


	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	counter = get_tree().get_nodes_in_group("enemy").size()
	if counter == 0:
		$TextureRect.texture = ResourceLoader.load("res://gamejamdoorunlocked.webp")
		emit_signal("open")
		#$Main/Walls2/CollisionShape2D6.disabled = true
		#$Main/Walls/CollisionShape2D6.disabled = true



#func _on_mouse_entered() -> void:
#	$TextureRect.texture = ResourceLoader.load("res://gamejamdoorunlocked.webp")
#	pass # Replace with function body.
