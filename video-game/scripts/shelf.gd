extends Area2D

@export var player: CharacterBody2D
@export var stock_box: Area2D
@export var target: RemoteTransform2D

var in_stock = {}
var stock = preload("res://scenes/stock.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func place(place_items):
	in_stock.assign(stock_box.in_box)
	print(in_stock)
	for item in in_stock:
		add_child(stock.instantiate())
