extends ColorRect

@export var shelf: Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = randf_range(0.0,20.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
