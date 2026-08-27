extends Area2D

var stock = preload("res://scenes/stock.tscn")
var lift = 0
var nearest_stock

var in_box = {
	"things" : 10,
	"dodads": 5
	}

@export var player: CharacterBody2D
@export var shelf: Area2D
@export var label: Label

func _ready(): # Define variables
	var in_box = {
	"things" : 10,
	"dodads": 5
	}
	var button = get_tree().get_first_node_in_group("button")
	label = get_tree().get_first_node_in_group("label")
	player = get_tree().get_first_node_in_group("player")
	shelf = get_tree().get_first_node_in_group("shelf")
	label.fade(0.0, 0)	
	z_index = -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var stocks = get_tree().get_nodes_in_group("stock")
	var shelves = get_tree().get_nodes_in_group("shelf")
	if get_overlapping_bodies():
		if player.interactable and not player.can_stock and not player.pick_up: # Interact label
			label.text = "press e to pick up"
			label.fade(1.0, .5)
		if not player.interactable and not player.can_stock and not player.pick_up:
			label.fade(0.0, .5)
				
		if not shelf == null and not player == null:
			if player.can_stock and Input.is_action_just_pressed("ui_interact"): # If the player tries to stock shelf
				for shelf in shelves:
					if shelf.get_overlapping_bodies(): 
						if shelf.is_stocked: # If the touching shelf is stocked
							print("this shelf is stocked already!")
						elif not shelf.is_stocked: # if the touching shelf ISN'T stocked
							label.visible = false
							await get_tree().create_timer(0.05).timeout
							shelf.place(1)
							in_box.clear()
			if player.can_stock and not in_box.is_empty(): # Lift box when near shelf 
				nearest_stock.lift = -10
			else:
				lift = 0
				
			if in_box.is_empty(): # Get rid of box when empty
				var tween = get_tree().create_tween()
				tween.tween_property(nearest_stock, "position", player.position + Vector2(30,0)*Input.get_axis("ui_left","ui_right")+Vector2(0,0), 0.1)
				await get_tree().create_timer(0.05).timeout
				queue_free()
				
			if player.pick_up and not in_box.is_empty(): # Player pick up box 
				z_index = 0
				var tween = get_tree().create_tween()
				tween.tween_property(nearest_stock, "position", player.position + Vector2(30,0)*Input.get_axis("ui_left","ui_right")+Vector2(0,lift), 0.1)
				if not player.can_stock:
					label.fade(0.0, .5)
				await get_tree().create_timer(0.2).timeout
				if Input.is_action_just_pressed("ui_interact") and not player.can_stock:
					player.squish(1.2,0.1)
					move_toward(nearest_stock.position.x, nearest_stock.position.x+player.direction_x*10, 0.1)
					player.pick_up = false
					nearest_stock.z_index = -1
			if player.pick_up and player.can_stock:
				label.text = "press e to stock"
				label.fade(1.0, .5)
				await get_tree().create_timer(2).timeout
				label.fade(0.0, .5)
