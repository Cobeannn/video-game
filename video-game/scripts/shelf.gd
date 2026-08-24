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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_overlapping_bodies():
		touching_shelf = self
	if Input.is_action_just_pressed("ui_check"):
		print(touching_shelf)


func place(place_items):
	in_stock.assign(stock_box.in_box)
	add_child(stock.instantiate())


func find_nearest_shelf():
	pass
