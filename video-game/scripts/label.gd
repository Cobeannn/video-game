extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func fade(fade_to, fade_time):
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate:a", fade_to, fade_time)
