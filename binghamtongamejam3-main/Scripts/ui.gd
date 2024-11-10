extends Control

@onready var Life = $LivesLeft

func set_lives(amount):
	Life.text = str(amount)
