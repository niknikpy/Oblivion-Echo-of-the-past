extends Area2D

func _ready():
	body_entered.connect(_player_entered)
	
func _player_entered(body):
	GameStateService.on_scene_transitioning()
	get_tree().change_scene_to_file("res://Scenes/GUI/win_screen.tscn")
