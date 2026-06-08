extends Area2D

@export var player: CharacterBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.pick_up:
		position = player.position + Vector2(40,-20)
		await get_tree().create_timer(0.2).timeout
		if Input.is_action_just_pressed("ui_interact"):
			player.pick_up = false


func _player_touch(area: Area2D) -> void:
	print("AHHH")
