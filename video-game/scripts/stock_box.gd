extends Area2D

var items: int = 5
var stock = preload("res://scenes/stock.tscn")

@export var player: CharacterBody2D
@export var shelf: Area2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.can_stock and Input.is_action_just_pressed("ui_interact"):
		place(1)
	if items <= 0:
		print("box empty!")
		queue_free()
	if player.pick_up:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", player.position + Vector2(30,0)*Input.get_axis("ui_left","ui_right"), 0.1)
		await get_tree().create_timer(0.2).timeout
		if Input.is_action_just_pressed("ui_interact") and not player.can_stock:
			player.pick_up = false


func place(place_items):
	items -= place_items
	add_sibling(stock.instantiate())
