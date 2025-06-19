extends Node

var water: Water
var water_start_pos: Vector2
var player: Player
var player_start_pos: Vector2

func register_water(p_water: Water):
    water = p_water
    water_start_pos = water.global_position

func register_player(p_player: Player):
    player = p_player
    player_start_pos = player.global_position
''
func death():
    player.global_position = player_start_pos
    water.global_position = water_start_pos
