extends Node

func test_change_resolution():
    # Изменяем разрешение
    OS.window_size = Vector2(800, 600)
    yield(get_tree(), "idle_frame")
    
    # Проверяем, что приложение работает
    assert_true(OS.window_size == Vector2(800, 600), "Разрешение не изменилось")
    assert_true(!Engine.has_crashed(), "Приложение крашится при изменении разрешения")
