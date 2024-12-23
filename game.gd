extends Node2D

var speed = 400
@onready var player = $player

func _physics_process(delta: float) -> void:
	var joy: Vector2 = $Joystick.get_joy()
	print(joy)
	player.velocity = joy * speed
	player.rotation = joy.angle() + PI/2
	player.move_and_slide()
