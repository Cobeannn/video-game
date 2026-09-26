extends Button

@onready var timer = $Timer

var box = preload("res://scenes/stock_box.tscn")
var target 
var player
var turn_off_tips = false
var stock_spawn
var countdown
var money_counter
var price = 35

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	money_counter = get_tree().get_first_node_in_group("money_counter")
	player = get_tree().get_first_node_in_group("player")
	stock_spawn = get_tree().get_first_node_in_group("stock_spawner")
	countdown = get_tree().get_first_node_in_group("countdown")
	timer = get_tree().get_first_node_in_group("timer")
	
	target = stock_spawn
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if countdown.visible:
		countdown.text = str(snapped(timer.time_left,0.01))

func _on_pressed() -> void:
	if not money_counter.money < price:
		money_counter.money -= price

		var clock = get_tree().get_first_node_in_group("scenetransition")
		var new_box = box.instantiate()
		new_box.add_to_group("stock")
		
		new_box.in_box = {
		"things" : 10,
		"dodads": 5
		}
		
		
		timer.start(5)
		countdown.visible = true
		
		await timer.timeout
		countdown.scale = Vector2(1,1)
		countdown.visible = false
		
			
		new_box.global_position = target.global_position
		target.add_sibling(new_box)
		new_box.body_entered.connect(player._on_stock_body_entered)
		new_box.body_exited.connect(player._on_stock_body_exited)
