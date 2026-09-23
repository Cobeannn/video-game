extends Area2D

var player
var is_stocked 
var stock_box
var in_stock
var stock
var touching_shelf
var customer_touching
var customer
var timers
var timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_stocked = false
	stock = preload("res://scenes/stock.tscn")
	in_stock = {}
	player = get_tree().get_first_node_in_group("player")
	stock_box = get_tree().get_first_node_in_group("stock")
	customer = get_tree().get_nodes_in_group("customer")
	add_to_group("shelf")
	timers =  get_tree().get_nodes_in_group("timer")
	timer = timers[1]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_overlapping_areas():
		var area = self
		if area.is_in_group("customer"):
			print("yup")
	if get_overlapping_bodies():
		touching_shelf = self
		if is_in_group("closed"):
			if Input.is_action_just_pressed("ui_interact"):
				timer.start()
				await timer.timeout
				remove_from_group("closed")
				await get_tree().create_timer(2).timeout
				print(is_in_group("closed"))
				add_to_group("closed")
			elif Input.is_action_just_released("ui_interact"):
				print("this is no longer a pressing matter")
				timer.stop()
	elif not get_overlapping_bodies():
		touching_shelf = null
	if Input.is_action_just_pressed("ui_check"):
		print(is_stocked)
	if not is_stocked:
		if get_child(2):
			get_child(2).queue_free()


func place(place_items):
	var shelves = get_tree().get_nodes_in_group("shelf")
	for shelf in shelves:
		if not shelf.touching_shelf == null:
			shelf.touching_shelf.add_child(stock.instantiate())
			shelf.is_stocked =  true
