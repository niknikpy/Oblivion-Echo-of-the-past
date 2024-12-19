extends Node

func test_pause_game():
    # Вызов меню паузы
    var game_scene = get_tree().get_current_scene()
    var pause_button = game_scene.get_node("PauseButton")
    pause_button.emit_signal("pressed")
    
    yield(get_tree(), "idle_frame")  # Ожидаем смены состояния
    
    assert_true(get_tree().paused, "Игра не на паузе")
    var pause_menu = game_scene.get_node("PauseMenu")
    assert_true(pause_menu.visible, "Меню паузы не отображается")
