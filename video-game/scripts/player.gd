extends CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var tween = get_tree().create_tween()
	Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if Input.is_action_just_pressed("ui_up"):
		tween.tween_property(self, "rotation", 0.0, 0.1)
	elif Input.is_action_just_pressed("ui_down"):
		tween.tween_property(self, "rotation", PI, 0.1)
	elif Input.is_action_just_pressed("ui_right"):
		tween.tween_property(self, "rotation", PI/2, 0.1)
	elif Input.is_action_just_pressed("ui_left"):
		tween.tween_property(self, "rotation", (PI/2)*3, 0.1)
	
