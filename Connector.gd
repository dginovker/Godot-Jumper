extends Node

var water: Water
var water_start_pos: Vector2
var player: Player
var player_start_pos: Vector2
var ui: UI

func register_water(p_water: Water):
    water = p_water
    water_start_pos = water.global_position

func change_water_speed(speed: float):
    water.speed = speed
    ui.score_multiplier_lb.text = "Score Multiplier: " + str(int(speed)) + "x"

func register_player(p_player: Player):
    player = p_player
    player_start_pos = player.global_position

func register_ui(p_ui: UI):
    ui = p_ui
    ui.visible = false

func death():
    ui.score_lb.text = "Score: " + str(int(-player.global_position.y + player_start_pos.y + 100)*water.speed)
    ui.visible = true

func respawn():
    ui.visible = false
    player.global_position = player_start_pos
    water.global_position = water_start_pos
