@tool
extends Control

var center: Vector2
var radius: float
var joy: Vector2 = Vector2.ZERO
var active: bool = false

func _enter_tree() -> void:
	center = size/2 + global_position
	radius = min((size/2).x,(size/2).y)

func _process(delta: float) -> void:
	center = size/2 + global_position
	radius = min((size/2).x,(size/2).y)
	if not active: joy = Vector2.ZERO
	queue_redraw()

func get_joy():
	return ceil(joy / radius * 100) / 100

func _draw() -> void:
	draw_circle(center-global_position,radius,Color.GRAY)
	draw_circle(joy+center-global_position,radius/7,Color.BLACK)
	
func _input(event: InputEvent) -> void:
	#print(event)
	if event is InputEventScreenDrag and active:
		joy = (event.position - center)
		if joy.length() > radius:
			joy = joy.normalized() * (radius)
	if event is InputEventScreenTouch:
		if event.is_pressed():
			if event.position.distance_to(center) > radius: return
			active = true
		else:
			active = false
