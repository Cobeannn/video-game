extends PathFollow2D

@onready var speed = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_child_count() >= 0:
		progress += speed
		if progress_ratio >= 1:
			speed = 0 
			await get_tree().create_timer(2).timeout
			speed = -0.1 
			await get_tree().create_timer(20).timeout
			get_parent().queue_free()
