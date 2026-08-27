extends Area2D

var player
var is_stocked 
var stock_box
var in_stock
var stock
var touching_shelf

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_stocked = false
	stock = preload("res://scenes/stock.tscn")
	in_stock = {}
	player = get_tree().get_first_node_in_group("player")
	stock_box = get_tree().get_first_node_in_group("stock")
	add_to_group("shelf")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_overlapping_bodies():
		touching_shelf = self
	elif not get_overlapping_bodies():
		touching_shelf = null
	if Input.is_action_just_pressed("ui_check"):
		print(is_stocked)


func place(place_items):
	var shelves = get_tree().get_nodes_in_group("shelf")
	for shelf in shelves:
		if not shelf.touching_shelf == null:
			shelf.touching_shelf.add_child(stock.instantiate())
			shelf.is_stocked =  true
