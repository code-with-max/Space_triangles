extends Node2D

#@onready var parent_space1 = get_node('/root/deep_space')
@onready var parent_space2 = get_parent().get_parent()
@onready var gun = get_parent()
#@onready var parent_space3 = get_parent().get_owner()

@export var bullet: PackedScene

var loaded = true


func shoot():
	if loaded:
		var bul = bullet.instantiate()
		bul.set_position($Position2D.get_global_position())
#		print(get_parent().position)
#		print(parent_space2.name)
		$AudioStreamPlayer.play()
		get_node('/root/deep_space').add_child(bul)
		loaded = false
		$reload_time.start()


func _on_reload_time_timeout():
	loaded = true
