extends ColorRect

var transition = false
var day = 1

@export var label: Label
@export var clock: Label
@export var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if clock.transition:
		clock.transition = false
		player.lock_movement = true
		await get_tree().create_timer(2).timeout
		visible = true
		modulate.a = 0.0
		var tween = get_tree().create_tween()
		tween.tween_property(self, "modulate:a", 1.0, 2)
		await get_tree().create_timer(3).timeout
		label.text = "DAY " + str(day+1)
		day += 1
		await get_tree().create_timer(2).timeout
		player.lock_movement = false
		var tween2 = get_tree().create_tween()
		tween2.tween_property(self, "modulate:a", 0.0, 0.5)
