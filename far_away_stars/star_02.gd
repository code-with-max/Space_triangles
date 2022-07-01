extends Node2D


# Set default speed (use only Y for falling down):
@export var move_speed = Vector2(0, 30)
# Set max star falling speed
@export var MAX_SPEED = 50


# Using colors for stars
# 	From Inspector:
#@export var colors: Array[Color]
#	or from code, using presets 
var colors = [
	Color.DARK_CYAN, 
	Color.DARK_VIOLET, 
	Color.DARK_GOLDENROD,
	]


# Called when the node enters the scene tree for the first time.
func _ready():
#	Set color (Default is WHITE)
	$Star_body.set_color(random_choice(colors))
	
#	Set random speed (see the global_data.gd)
	move_speed.y = randi() % MAX_SPEED + 10
#	$Star_body/Label_speed.set_text(str(move_speed.y))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += move_speed * delta
#	if position.y > 500:
#		queue_free()


func random_choice(array):
	array.shuffle()
	return array.front()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
