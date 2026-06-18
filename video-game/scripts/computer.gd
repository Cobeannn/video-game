extends Area2D

var screen = preload("res://scenes/computer_screen.tscn")
var screen_open = false


@export var player: CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_interact") and player.computer_interact:
		get_tree().change_scene_to_file("res://scenes/computer_screen.tscn")
