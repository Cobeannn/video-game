extends PathFollow2D

var speed
var prev_speed

@export var werido_chance := 0.02

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speed = randi_range(50,100)
	if randf() <= werido_chance:
		speed = 500
	prev_speed = speed
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_child_count() >= 0:
		progress += speed * delta
		if progress_ratio >= 1:
			speed = 0 
			await get_tree().create_timer(2).timeout
			speed = prev_speed * -1
			await get_tree().create_timer(60).timeout
			get_parent().queue_free()
