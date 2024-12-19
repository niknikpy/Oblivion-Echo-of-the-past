extends Node

func test_launch_game():
    # Проверяем, что начальная сцена — главное меню
    var main_menu = get_tree().get_current_scene()
    assert_true(main_menu.name == "MainMenu", "Главное меню не отображается")
