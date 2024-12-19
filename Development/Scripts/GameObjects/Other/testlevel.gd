class_name TestLevel
extends Node2D

@onready var pause_menu_interface = $Pause_menu_interface
@onready var pause_btn = $Game_interface/Control/MarginContainer/pause_btn as Button
@onready var game_timer = $Game_interface/Control/MarginContainer/game_timer as Timer
@onready var game_timer_lbl = $Game_interface/Control/MarginContainer/game_timer_lbl as Label
@export var lose_screen = preload("res://Scenes/GUI/lose_screen.tscn") as PackedScene
@onready var lock = $Lock
@export var RedClr : Color

var paused = false

func _ready():
	game_timer.wait_time = Global.time_left
	game_timer.start()
	paused = false

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pause_menu_meneger()
	if Global.puzzle_solved:
		remove_child(lock)
	if game_timer.time_left != 0:
		update_game_timer_label_text()
	else:
		game_timer.stop()
		get_tree().change_scene_to_packed(lose_screen)
		
func pause_menu_meneger() -> void:
	if paused:
		pause_menu_interface.hide()
		Engine.time_scale = 1
	else:
		pause_menu_interface.show()
		Engine.time_scale = 0
	paused = !paused

func _on_pause_btn_pressed():
	pause_menu_meneger()
	
func update_game_timer_label_text():
	var time_left = int(floor(game_timer.time_left))
	var minutes_left = str(time_left / 60)
	if len(minutes_left) == 1:
		minutes_left = "0" + minutes_left
	var sec_left = str(time_left % 60)
	if len(sec_left) == 1:
		sec_left = "0" + sec_left
	game_timer_lbl.text = minutes_left + ":" + sec_left
	Global.time_left -= 0.01
	if game_timer.time_left < 60:
		game_timer_lbl.modulate = RedClr
