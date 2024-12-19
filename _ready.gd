extends Node

func _ready():
    # Подключаем тестовые файлы
    var test_files = [
        preload("res://tests/test_launch_game.gd"),
        preload("res://tests/test_start_game.gd"),
        preload("res://tests/test_pause_game.gd"),
        preload("res://tests/test_wall_collision.gd"),
        preload("res://tests/test_change_resolution.gd"),
        preload("res://tests/test_invalid_input_in_settings.gd"),
    ]
    
    # Запускаем тесты
    for test in test_files:
        var test_instance = test.new()
        test_instance.run()
