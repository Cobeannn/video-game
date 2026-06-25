extends CharacterBody2D
var interactable = false
var pick_up = false
var can_stock = false
var computer_interact = false
var direction_x = 0
var lock_movement = false

const SPEED = 150.0

@export var stock: Area2D
@export var sprite: Sprite2D


func _ready():
	pass


func _physics_process(delta: float) -> void:
	if not lock_movement:
		var direction_x := Input.get_axis("ui_left", "ui_right")
		if direction_x:
			velocity.x = direction_x * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		var direction_y := Input.get_axis("ui_up", "ui_down")
		if direction_y:
			velocity.y = direction_y * SPEED
		else:
			velocity.y = move_toward(velocity.x, 0, SPEED)
			
		if direction_x == -1 and sprite.flip_h == false:
			sprite.flip_h = true
			sprite.scale.y = sprite.scale.y/1.05
			await get_tree().create_timer(0.1).timeout
			sprite.scale.y = 3.6
		if direction_x == 1 and sprite.flip_h == true:
			sprite.flip_h = false
			sprite.scale.y = sprite.scale.x/1.05
			await get_tree().create_timer(0.1).timeout
			sprite.scale.y = 3.6
		

		move_and_slide()


func _process(delta):
	direction_x = Input.get_axis("ui_left", "ui_right")
	if Input.is_action_just_pressed("ui_interact") and interactable: 
		squish(1.1,0.1)
		pick_up = true


func _touch_shelf(body: Node2D) -> void:
	if pick_up:
		print("Press 'E' to stock")
		can_stock = true


func _not_touch_shelf(body: Node2D) -> void:
	can_stock = false


func _on_computer_body_entered(body: Node2D) -> void:
	print("Press 'E' to open Computer")
	computer_interact = true


func _on_computer_body_exited(body: Node2D) -> void:
	computer_interact = false


func _on_stock_body_entered(body: Node2D) -> void:
	print("pick me up twin")
	interactable = true


func _on_stock_body_exited(body: Node2D) -> void:
	interactable = false
	
func squish(squish_amount,squish_time):
	sprite.scale.y = sprite.scale.x/squish_amount
	await get_tree().create_timer(squish_time).timeout
	sprite.scale.y = 3.6
