extends Area2D

var stock = preload("res://scenes/stock.tscn")
var lift = 0

var in_box = {
	"things" : 10,
	"dodads": 5
	}

@export var player: CharacterBody2D
@export var shelf: Area2D
@export var label: Label

func _ready():
	player = get_tree().get_first_node_in_group("player")
	shelf = get_tree().get_first_node_in_group("shelf")
	z_index = -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.interactable:
		label.visible = true
	if not player.interactable:
		label.visible = false	
	if not shelf == null and not player == null:
		if player.can_stock and Input.is_action_just_pressed("ui_interact") and not shelf.is_stocked:
			label.visible = false
			await get_tree().create_timer(0.05).timeout
			
			shelf.place(1)
			shelf.is_stocked = true
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
			label.visible = false
			z_index = 0
			var tween = get_tree().create_tween()
			tween.tween_property(self, "position", player.position + Vector2(30,0)*Input.get_axis("ui_left","ui_right")+Vector2(0,lift), 0.1)
			await get_tree().create_timer(0.2).timeout
			if Input.is_action_just_pressed("ui_interact") and not player.can_stock:
				player.squish(1.2,0.1)
				move_toward(position.x, position.x+player.direction_x*10, 0.1)
				player.pick_up = false
				z_index = -1
