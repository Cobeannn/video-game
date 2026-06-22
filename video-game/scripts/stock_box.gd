extends Area2D

var stock = preload("res://scenes/stock.tscn")
var lift = 0

var in_box = {
	"things" : 10,
	"dodads": 5
}

@export var player: CharacterBody2D
@export var shelf: Area2D
func _ready():
	z_index = -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.can_stock and Input.is_action_just_pressed("ui_interact"):
		await get_tree().create_timer(0.05).timeout
		shelf.place(1)
		in_box.clear()
	if player.can_stock and not in_box.is_empty():
		lift = -10
	else:
		lift = 0
	if in_box.is_empty():
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", player.position + Vector2(30,0)*Input.get_axis("ui_left","ui_right")+Vector2(0,0), 0.1)
		await get_tree().create_timer(0.05).timeout
		queue_free()
	if player.pick_up and not in_box.is_empty():
		z_index = 0
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", player.position + Vector2(30,0)*Input.get_axis("ui_left","ui_right")+Vector2(0,lift), 0.1)
		await get_tree().create_timer(0.2).timeout
		if Input.is_action_just_pressed("ui_interact") and not player.can_stock:
			player.squish(1.2,0.1)
			move_toward(position.x, position.x+player.direction_x*10, 0.1)
			player.pick_up = false
			z_index = -1
