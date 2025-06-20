extends Control
class_name UI

# Respawn panel stuff
@onready var score_lb: Label
@onready var respawn_panel: PanelContainer = $RespawnPanelContainer

# Settings panel stuff
@onready var settings_panel: PanelContainer = $SettingsPanelContainer
@onready var speed_slider: HSlider = $SettingsPanelContainer/MarginContainer/VBoxContainer/HSlider
@onready var score_multiplier_lb: Label = $SettingsPanelContainer/MarginContainer/VBoxContainer/ScoreMultiplierLb

func _ready():
    Connector.register_ui(self)

    score_lb = $RespawnPanelContainer/MarginContainer/VBoxContainer/ScoreLb

    var respawn_button: Button = $RespawnPanelContainer/MarginContainer/VBoxContainer/RespawnButton
    respawn_button.connect("pressed", Connector.respawn)

    var settings_button: Button = $RespawnPanelContainer/MarginContainer/VBoxContainer/SettingsButton
    settings_button.connect("pressed", _open_settings)

    speed_slider.value_changed.connect(Connector.change_water_speed)

    var back_button: Button = $SettingsPanelContainer/MarginContainer/VBoxContainer/BackButton
    back_button.connect("pressed", _leave_settings)

    settings_panel.visible = false
    respawn_panel.visible = true

func _open_settings():
    respawn_panel.visible = false
    settings_panel.visible = true
    
func _leave_settings():
    settings_panel.visible = false
    respawn_panel.visible = true
