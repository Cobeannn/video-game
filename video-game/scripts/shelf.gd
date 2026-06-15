extends Area2D

@export var player: CharacterBody2D
@export var stock_box: Area2D
@export var target: RemoteTransform2D

var stock = preload("res://scenes/stock.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func place(place_items):
	stock_box.items -= place_items
	for item in place_items:
		add_child(stock.instantiate())
