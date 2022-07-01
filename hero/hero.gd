extends Node2D

var velocity = Vector2(260, 0)
var dir = Vector2()
var acceleration = Vector2()
var gun = null
@onready var parent_space = get_parent()

@export var bullet: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	set_position(Vector2(240, 560))
	set_weapon()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dir != Vector2.ZERO:
#		print(velocity, dir)
		position += dir * velocity * delta
		position.x = clamp(position.x, 0, 480)
		dir = Vector2.ZERO
	if Input.is_action_pressed("ui_accept"):
		print("space")


func _input(event):
	if event is InputEventScreenDrag:
#		May use relative as acceleration
		if event.get_relative().x > 0:
			dir = Vector2.RIGHT
		else:
			dir = Vector2.LEFT
#		print("Move")
	if event is InputEventScreenTouch and not event.is_pressed():
		if dir == Vector2.ZERO or event.index >= 1:
			print("shoot")
#			print(event.index)
#			print(get_parent())
			gun.shoot()
#			var bul = bullet.instantiate()
#			bul.position = position
#			get_node('/root/deep_space').add_child(bul)


func set_weapon():
	gun = parent_space.weapons[0].instantiate()
	gun.set_position($gun_handler.get_position())
	add_child(gun)
