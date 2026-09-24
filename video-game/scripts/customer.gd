extends Area2D

var shelves
var sprite


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shelves = get_tree().get_nodes_in_group("shelf")
	sprite = get_tree().get_first_node_in_group("sprite")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func squish(squish_amount,squish_time):

	sprite.scale.y = sprite.scale.x/squish_amount

	await get_tree().create_timer(squish_time).timeout
	sprite.scale.y = 3.6
	
