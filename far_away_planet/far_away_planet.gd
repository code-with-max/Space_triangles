extends Node2D

# Set default speed (use only Y for falling down):
@export var move_speed = Vector2(0, 20)
# Set max star falling speed
@export var MAX_SPEED = 30


# Planet sprite
# 	Load from inspector:
#@export var planet_sprite: Array[Texture2D]
# 	or load from code:
#var planet_sprite = [
#	preload("res://far_away_planet/g887.png"),
#	preload("res://far_away_planet/g983.png"),
#	]

@export var planet_scaling: Array[Vector2]


# Called when the node enters the scene tree for the first time.
func _ready():
#	Set random speed (see the global_data.gd)
	move_speed.y = randi() % MAX_SPEED + 10
	
#	Set planet scaling
	set_scale(random_choice(planet_scaling))
	
#	Load planet sprites from array (No Default)
#	$Sprite2D.set_texture(random_choice(planet_sprite))
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += move_speed * delta


func random_choice(array):
	array.shuffle()
	return array.front()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
