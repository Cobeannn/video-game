extends CharacterBody2D
var interactable = false
var pick_up = false
var can_stock = false

const SPEED = 150.0

@export var stock: Area2D

func _physics_process(delta: float) -> void:
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

	move_and_slide()


func _ready():
	pass


func _process(delta):
	if Input.is_action_just_pressed("ui_interact") and interactable: 
		pick_up = true

func _on_stock_touch(body: Node2D) -> void:
	interactable = true


func _on_stock_exit(body: Node2D) -> void:
	interactable = false


func _touch_shelf(body: Node2D) -> void:
	if pick_up:
		print("Press 'E' to stock")
		can_stock = true


func _not_touch_shelf(body: Node2D) -> void:
	can_stock = false
