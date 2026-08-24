extends Marker2D

var probablity = 0.0
var customer
var path_1
var path_2
var path_3
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
	paths = [path_1, path_2, path_3]
	for i in range(15): 
		await get_tree().create_timer(3).timeout
		probablity = clock.time / rush_hour
		print(probablity)
		if randf() < probablity:
			path = paths.pick_random()
			print(path)
			var new_path = path.instantiate()
			scene.add_child(new_path)
			path_follow = new_path.get_child(0)
			
			path_follow.add_child(customer.instantiate())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
