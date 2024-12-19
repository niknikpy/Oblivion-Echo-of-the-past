extends CharacterBody2D

@export var speed : int = 150.0
@onready var animation_player = $AnimationPlayer

func handle_input_for_movement() -> void:
	var moveDirection = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = moveDirection * speed

func update_animation() -> void:
	if velocity.length() == 0:
		if animation_player.is_playing():
			animation_player.stop()
	else:
		var direction = "down"
		if velocity.x < 0: direction = "left"
		elif velocity.x > 0: direction = "right"
		elif velocity.y < 0: direction = "up"
		animation_player.play("Walk_" + direction)

func _physics_process(delta):
	handle_input_for_movement()
	move_and_slide()
	update_animation()
