extends Control

func _on_main_menu_btn_pressed():
	Global.new_game = false
	get_tree().change_scene_to_file("res://Scenes/GUI/main_menu_interface.tscn")
