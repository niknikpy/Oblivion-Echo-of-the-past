extends Node

func test_start_game():
    # Нажимаем кнопку "Play"
    var main_menu = get_tree().get_current_scene()
    var play_button = main_menu.get_node("PlayButton")
    play_button.emit_signal("pressed")
    
    yield(get_tree(), "idle_frame")  # Ожидаем загрузки сцены
    
    var game_scene = get_tree().get_current_scene()
    assert_true(game_scene.name == "GameScene", "Сцена игры не загрузилась")
    assert_true(game_scene.get_node("Player").position != null, "Игрок не появился")
