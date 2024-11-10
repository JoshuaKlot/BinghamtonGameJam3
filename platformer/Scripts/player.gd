extends CharacterBody2D

var damage = 1
var basedamage = 1
var baseSpeed = 100.0
var SPEED = 100.0
const JUMP_VELOCITY = -400.0
const bullet_speed = 300.0
@onready var _animated_sprite = $AnimatedSprite2D
var lastdirection = Vector2.DOWN
var bullet = preload("res://scenes/bullet.tscn")
@onready var main = get_node("bulletContainer")
var shootTimer = 0.0
var isShooting = true

var health = 3
var baseHealth = 3

var baseCritChance = 0.10
var critChance = 0.10

var attackSpeed = 5

var allPowersArray = [50,10,5,0,10,0,0,0,0,0,0,0] #all the powers
#all indices and their powers
#index 0 = 
#index 1 = 
#index 2 = 
#index 3 = 
#index 4 = 
#index 5 = 
#index 6 = 
#index 7 = 
#index 8 = 
#index 9 = 

#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if allPowersArray[0]:  #damage up
		damage = basedamage + allPowersArray[0]
	if allPowersArray[2]:  #critical hits
		critChance = baseCritChance + (0.05 * allPowersArray[2])
	if allPowersArray[3]:  #Max HP up
		pass
	if allPowersArray[4]:  #runSpeed up
		SPEED = baseSpeed + (10 * allPowersArray[4])
	if allPowersArray[5]:  #
		pass
	if allPowersArray[6]:
		pass
	if allPowersArray[7]:
		pass
	if allPowersArray[8]:
		pass
	if allPowersArray[9]:
		pass
func _physics_process(delta: float) -> void:
	
	look_at(get_global_mouse_position())
	if health <= 0:
		queue_free() #restart menu
		
	shooting(delta)
	move()


func calculateCrit():
	if randf() < (1 - critChance):
		damage = basedamage
	else:
		damage = 2 * basedamage
		
func take_damage():
	print(health)
	health = health - 1
	
func shootBullet():
	var instance = bullet.instantiate()
	if allPowersArray[1]:  #BASED ON PELLET POWER size up
		instance.scale = Vector2(5,5)
	calculateCrit()
	get_tree().root.add_child(instance)
	instance.global_position = global_position
	instance.rotation = rotation

func move():
	var direction := Input.get_axis("ui_left", "ui_right")
	var direction2 := Input.get_axis("ui_up", "ui_down")

	if direction or direction2:
		velocity.x = direction * SPEED
		velocity.y = direction2 * SPEED
		_animated_sprite.play("Walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		_animated_sprite.play("Idle")

	move_and_slide()
	
func shooting(delta):
	if Input.is_action_pressed("shoot"):
		if isShooting:
			shootTimer += delta
			if shootTimer > attackSpeed:
				shootBullet()
				shootTimer = 0
			else:
				shootBullet()
				isShooting = true
				shootTimer = 0
	if Input.is_action_just_released("shoot"):
		isShooting = false
