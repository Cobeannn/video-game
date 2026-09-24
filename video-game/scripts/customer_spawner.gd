extends Marker2D

var probablity = 0.0
var customer
var path_1
var path_2
var path_3
var path_4
var paths = []
var path_follow
var path
var rush_hour = 17

@export var clock: Label
@export var scene: Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	customer = preload("res://scenes/customer.tscn")
	path_1 = preload("res://scenes/path_1.tscn")
	path_2 = preload("res://scenes/path_2.tscn")
	path_3 = preload("res://scenes/path_3.tscn")
	path_4 = preload("res://scenes/path_4.tscn")
	paths = [path_1, path_2, path_3, path_4]
	for i in range(15): 
		await get_tree().create_timer(5).timeout
		probablity = clock.time / rush_hour - 0.3
		if randf() < probablity:
			path = paths.pick_random()
			var new_path = path.instantiate()
			scene.add_child(new_path)
			path_follow = new_path.get_child(0)
			
			path_follow.add_child(customer.instantiate())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
