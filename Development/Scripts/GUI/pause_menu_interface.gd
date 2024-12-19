extends Control

@onready var game = $"../../"
@onready var settings_menu_interface = $settings_menu_interface as SettingsMenu
@onready var margin_container = $MarginContainer as MarginContainer

func _ready():
	settings_menu_interface.exit_settings_menu.connect(on_exit_settings_menu)

func _on_continue_pressed():
	game.pause_menu_meneger()

func _on_settings_pressed():
	margin_container.visible = false
	settings_menu_interface.set_process(true)
	settings_menu_interface.visible = true
	
func on_exit_settings_menu() -> void:
	margin_container.visible = true
	settings_menu_interface.visible = false

func _on_quit_pressed():
	Engine.time_scale = 1
	GameStateService.on_scene_transitioning()
	get_tree().change_scene_to_file("res://Scenes/GUI/main_menu_interface.tscn")
