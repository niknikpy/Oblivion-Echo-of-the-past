extends Node

func test_invalid_input_in_settings():
    var settings_menu = get_tree().get_current_scene().get_node("SettingsMenu")
    var resolution_input = settings_menu.get_node("ResolutionInput")
    
    resolution_input.text = "abc"  # Некорректное значение
    var apply_button = settings_menu.get_node("ApplyButton")
    apply_button.emit_signal("pressed")
    
    yield(get_tree(), "idle_frame")  # Ждём завершения действия
    
    # Проверяем, что некорректное значение не применяется
    assert_true(OS.window_size != Vector2("abc"), "Некорректное значение применено")
    assert_true(settings_menu.get_node("ErrorMessage").visible, "Сообщение об ошибке не отображается")
