extends Label

var time = 6.0
var transition = false
var time_takeaway = 0
var repeats = 2
var am_pm = " AM"
var time_speed = 5
var rush_hour = 17.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Time: " + str(int(time) - time_takeaway) + am_pm
	for i in range(9999999999):
		await get_tree().create_timer(time_speed).timeout
		time += 1
		text = "Time: " + str(time-time_takeaway) + am_pm
		if time == 12:
			time_takeaway = 12
			am_pm = " PM"
		if time == 24:
			am_pm = " AM"
			transition = true
			time = 6
			time_takeaway = 0
			await get_tree().create_timer(4).timeout


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
