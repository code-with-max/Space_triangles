extends Node2D

@export var move_speed = Vector2(0, 200)


# Called when the node enters the scene tree for the first time.
func _ready():
	print("bullet ready")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position -= move_speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	print("bullet destroy")


func _on_area_2d_area_entered(area):
	print(area.get_parent())
	if area.get_parent().has_method("hit"):
		area.get_parent().hit()
		queue_free()
