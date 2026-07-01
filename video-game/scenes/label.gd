extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var tweener = get_tree().create_tween()
	tweener.tween_property(self, "position", position.y-100, 1)


func pop():
	var tweener = get_tree().create_tween()
	tweener.tween_property(self, "position", position.y-100, 1)
