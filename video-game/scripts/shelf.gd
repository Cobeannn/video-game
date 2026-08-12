extends Area2D

var player
var is_stocked = false
var stock_box
var in_stock = {}
var stock = preload("res://scenes/stock.tscn")
var touching_shelf

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	stock_box = get_tree().get_first_node_in_group("stock")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_overlapping_bodies():
		var touching_shelf = self
	if Input.is_action_just_pressed("ui_check"):
		pass


func place(place_items):
	in_stock.assign(stock_box.in_box)
	add_child(stock.instantiate())


func find_nearest_shelf():
	pass
