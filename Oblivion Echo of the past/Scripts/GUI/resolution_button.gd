extends Control

@onready var option_button = $HBoxContainer/OptionButton

const RESOLUTION_DICTIONARY : Dictionary = {
	"1152 x 648" : Vector2i(1152, 648),
	"1280 x 720" : Vector2i(1280, 720),
	"1920 x 1080" : Vector2i(1920, 1080)
}

func _ready():
	add_resolution_items()
	option_button.item_selected.connect(on_resolution_selected)

func centre_window() -> void:
	var centre_screen = DisplayServer.screen_get_position() + DisplayServer.screen_get_size()/2
	var window_size = get_window().get_size_with_decorations()
	get_window().set_position(centre_screen - window_size/2)

func add_resolution_items() -> void:
	for resolution in RESOLUTION_DICTIONARY:
		option_button.add_item(resolution)
	
func on_resolution_selected(index : int) -> void:
	DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[index])
	centre_window()
