extends Button

var box = preload("res://scenes/stock_box.tscn")
var target 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var start_target = get_parent()
	target = start_target.get_parent()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	target.add_sibling(box.instantiate())
