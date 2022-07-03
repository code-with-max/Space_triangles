extends Node2D

const DEBUG = true


@export var window_size = Vector2(480, 640)
@export var far_away_spawn_time = 3
@export var far_away_star_count = 5
@export var far_away_planet_count = 2
@export var far_star_count = 3
@export var enemies_count = 2

# Load far away stars from Inspector:
@export var far_away_stars: PackedScene
@export var far_stars: PackedScene
@export var planets: PackedScene
@export var heroes: PackedScene
@export var weapons: Array[PackedScene]
@export var enemies: Array[PackedScene]
# or load from code:
#var far_away_stars = preload("res://far_away_stars/star_01.tscn")
#var far_stars = preload("res://far_away_stars/star_02.tscn")
#var planets = preload("res://far_away_planet/far_away_planet.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
#	Set wait_time for far stars spawner (default 1 sec)
	$far_away_stars_spawn.set_wait_time(far_away_spawn_time)
	if DEBUG:
		$Debug_info.show()
		redraw_debug()
	var hero = heroes.instantiate()
	add_child(hero)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# Use it for redraw Debug_info node
func redraw_debug():
	var g = get_tree().get_nodes_in_group("far_away_stars")
	$Debug_info/far_stars.set_text("Far stars: " + str(g.size()))
	var s = get_tree().get_nodes_in_group("far_away_planet")
	$Debug_info/far_planets.set_text("Far planets: " + str(s.size()))


func _on_far_away_stars_spawn_timeout():
	var count = 0
	count = get_tree().get_nodes_in_group("far_away_stars").size()
	if count < far_away_star_count:
		var star = far_away_stars.instantiate()
#		Set X position (Default is 0)
#		position.x = randi() % int(GD.window_size.x)
		star.set_position(Vector2(randi() % int(window_size.x), 0))
		add_child(star)
	count = get_tree().get_nodes_in_group("far_stars").size()
	if count < far_star_count:
		var star = far_stars.instantiate()
#		Set X position (Default is 0)
#		position.x = randi() % int(GD.window_size.x)
		star.set_position(Vector2(randi() % int(window_size.x), 0))
		add_child(star)
	count = get_tree().get_nodes_in_group("far_away_planet").size()
	if count < far_away_planet_count:
		var planet = planets.instantiate()
#		Set X position (Default is 0)
		planet.set_position(Vector2(randi() % int(window_size.x), 0))
		add_child(planet)
	count = get_tree().get_nodes_in_group("enemies").size()
	if count < enemies_count:
		var enemy = enemies[0].instantiate()
		add_child(enemy)
#		Set X position (Default is 0)
	if DEBUG:
		redraw_debug()
