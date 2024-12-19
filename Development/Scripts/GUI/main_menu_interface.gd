class_name MainMenu
extends Control

@onready var new_game_btn = $MarginContainer/HBoxContainer/VBoxContainer/New_game_btn as Button
@onready var continue_btn = $MarginContainer/HBoxContainer/VBoxContainer/Continue_btn as Button
@onready var settings_btn = $MarginContainer/HBoxContainer/VBoxContainer/Settings_btn as Button
@onready var exit_btn = $MarginContainer/HBoxContainer/VBoxContainer/Exit_btn as Button
@onready var settings_menu_interface = $settings_menu_interface as SettingsMenu
@onready var margin_container = $MarginContainer as MarginContainer

func _ready():
	handle_connecting_signals()
	
func new_game_pressed() -> void:
	Global.new_game = true
	Global.time_left = 10
	Global.puzzle_solved = false
	GameStateService.new_game()
	get_tree().change_scene_to_file("res://Scenes/GameObjects/Other/testlevel.tscn")
	
func continue_pressed() -> void:
	if Global.new_game:
		GameStateService.on_scene_transitioning()
		get_tree().change_scene_to_file("res://Scenes/GameObjects/Other/testlevel.tscn")
	
func settings_pressed() -> void:
	margin_container.visible = false
	settings_menu_interface.set_process(true)
	settings_menu_interface.visible = true
	
func exit_pressed() -> void:
	get_tree().quit()
	
func on_exit_settings_menu() -> void:
	margin_container.visible = true
	settings_menu_interface.visible = false

func handle_connecting_signals() -> void:
	new_game_btn.button_down.connect(new_game_pressed)
	continue_btn.button_down.connect(continue_pressed)
	settings_btn.button_down.connect(settings_pressed)
	exit_btn.button_down.connect(exit_pressed)
	settings_menu_interface.exit_settings_menu.connect(on_exit_settings_menu)
