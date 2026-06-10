extends Area2D

@export var player: CharacterBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var tween = get_tree().create_tween()
	if player.pick_up:
		tween.tween_property(self, "position", player.position + Vector2(30,0)*Input.get_axis("ui_left","ui_right"), 0.1)
		await get_tree().create_timer(0.2).timeout
		if Input.is_action_just_pressed("ui_interact"):
			player.pick_up = false
