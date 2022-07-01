extends Node2D

@export var start_positions: Array[Vector2]
var move_speed = Vector2(100, 0)
var direction = Vector2.ZERO

var directions = [Vector2.LEFT, Vector2.RIGHT, Vector2.ZERO]

# Called when the node enters the scene tree for the first time.
func _ready():
	direction = random_choice(directions)
	set_position(random_choice(start_positions))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * move_speed * delta
	position.x = clamp(position.x, 40, 440)


func random_choice(array):
	array.shuffle()
	return array.front()


func _on_choose_dir_timer_timeout():
	direction = random_choice(directions)


func hit():
	print("Destroy...")
	queue_free()
