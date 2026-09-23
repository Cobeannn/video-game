extends Area2D

var shelves
var sprite
var money_counter
var want_unlocked = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shelves = get_tree().get_nodes_in_group("shelf")
	sprite = get_tree().get_first_node_in_group("sprite")
	money_counter = get_tree().get_first_node_in_group("money_counter")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for shelf in shelves: 
		if get_overlapping_areas():
			for overlapping_body in get_overlapping_areas():
				if overlapping_body.is_in_group("shelf"):
					if overlapping_body.is_stocked:
						if not overlapping_body.is_in_group("closed"):
							want_unlocked = false
							money_counter.money += 40
							overlapping_body.is_stocked = false
						elif overlapping_body.is_in_group("closed"):
							want_unlocked = true


func squish(squish_amount,squish_time):

	sprite.scale.y = sprite.scale.x/squish_amount

	await get_tree().create_timer(squish_time).timeout
	sprite.scale.y = 3.6
	
