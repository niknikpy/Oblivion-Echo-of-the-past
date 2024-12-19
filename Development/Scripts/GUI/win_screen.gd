extends Control

@onready var time_left_lbl = $MarginContainer/HBoxContainer/VBoxContainer/Time_left_lbl

func _ready():
	var time_left = int(Global.time_left)
	var mins = time_left / 60
	var secs = time_left % 60
	time_left_lbl.text = "У вас осталось: " + str(mins) + " минут, " + str(secs) + " секунд!"

func _on_main_menu_btn_pressed():
	Global.new_game = false
	get_tree().change_scene_to_file("res://Scenes/GUI/main_menu_interface.tscn")
