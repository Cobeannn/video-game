extends Button

var box = preload("res://scenes/stock_box.tscn")
var target 
var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	var start_target = get_parent()
	target = start_target.get_parent()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	var new_box = box.instantiate()
	new_box.add_to_group("stock")
	new_box.in_box = {
	"things" : 10,
	"dodads": 5
	}
	target.add_sibling(new_box)
	new_box.body_entered.connect(player._on_stock_body_entered)
	new_box.body_exited.connect(player._on_stock_body_exited)
	
