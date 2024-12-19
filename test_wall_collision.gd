extends Node

func test_wall_collision():
    # Проверяем коллизию персонажа со стеной
    var player = get_tree().get_current_scene().get_node("Player")
    var wall = get_tree().get_current_scene().get_node("Wall")
    
    # Двигаем персонажа к стене
    player.position = wall.position - Vector2(1, 0)
    yield(get_tree(), "idle_frame")
    
    # Проверяем, что персонаж не прошел через стену
    var player_position_after = player.position
    assert_true(player_position_after.x <= wall.position.x - 1, "Персонаж проходит сквозь стену")
