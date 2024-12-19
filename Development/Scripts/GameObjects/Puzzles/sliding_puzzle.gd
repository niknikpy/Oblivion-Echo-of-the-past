class_name Sliding_puzzle
extends Area2D

var tiles = []
var solved = []
var mouse = false

func _ready():
	start_game()

func start_game():
	tiles = [
		$Tile1,
		$Tile2,
		$Tile3,
		$Tile4,
		$Tile5,
		$Tile6,
		$Tile7,
		$Tile8,
		$Tile9,
		$Tile10,
		$Tile11,
		$Tile12,
		$Tile13,
		$Tile14,
		$Tile15,
		$Tile16
	]
	solved = tiles.duplicate()
	for i in range(16):
		tiles[i].position.y = 150 * (i / 4) + 100
		tiles[i].position.x = 150 * (i % 4) + 575
	shuffle_board(30)

func shuffle_board(n):
	var previos1 = 100
	var previos2 = 100
	for i in range(0, n):
		var tile = randi() % 16
		if tiles[tile] != $Tile16 and tile != previos1 and tile != previos2:
			var row = int((tiles[tile].position.y - 25) / 150)
			var column = int((tiles[tile].position.x - 500) / 150)
			check_neighbors(row, column)
			previos2 = previos1
			previos1 = tile
	
func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouse:
		var mouse_copy = mouse
		mouse = false
		var row = int((mouse_copy.position.y - 25) / 150)
		var column = int((mouse_copy.position.x - 500) / 150)
		check_neighbors(row, column)
		if tiles == solved:
			Global.puzzle_solved = true
			GameStateService.on_scene_transitioning()
			get_tree().change_scene_to_file("res://Scenes/GameObjects/Other/testlevel.tscn")

func check_neighbors(row, column):
	var empty = false
	var done = false
	var pos = row * 4 + column
	while !empty and !done:
		var new_pos = tiles[pos].position
		if row < 3:
			new_pos.y += 150
			empty = find_empty(new_pos, pos)
			new_pos.y -= 150
		if row > 0:
			new_pos.y -= 150
			empty = find_empty(new_pos, pos)
			new_pos.y += 150
		if column < 3:
			new_pos.x += 150
			empty = find_empty(new_pos, pos)
			new_pos.x -= 150
		if column > 0:
			new_pos.x -= 150
			empty = find_empty(new_pos, pos)
			new_pos.x += 150
		done = true

func find_empty(pos, tile_pos):
	var new_row = int((pos.y - 25) / 150)
	var new_column = int((pos.x - 500) / 150)
	var new_pos = new_row * 4 + new_column
	if tiles[new_pos] == $Tile16:
		swap_tiles(tile_pos, new_pos)
		return true
	return false

func swap_tiles(tile_src, tile_dst):
	var temp_pos = tiles[tile_src].position
	tiles[tile_src].position = tiles[tile_dst].position
	tiles[tile_dst].position = temp_pos
	var temp_tile = tiles[tile_src]
	tiles[tile_src] = tiles[tile_dst]
	tiles[tile_dst] = temp_tile

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		mouse = event

func _on_back_button_pressed():
	GameStateService.on_scene_transitioning()
	get_tree().change_scene_to_file("res://Scenes/GameObjects/Other/testlevel.tscn")

func _on_restart_button_pressed():
	start_game()
