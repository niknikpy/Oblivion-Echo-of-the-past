class_name  Game_interface
extends Control

@onready var button = $MarginContainer/Button as Button

signal open_pause_menu

func _ready():
	button.button_down.connect(on_open_pause_pressed)
	set_process(false)
	
func on_open_pause_pressed() -> void:
	open_pause_menu.emit()
	set_process(false)


