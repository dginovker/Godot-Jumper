extends Control
class_name UI

@onready var score_lb: Label

func _ready():
    score_lb = $PanelContainer/MarginContainer/VBoxContainer/ScoreLb
    Connector.register_ui(self)
    var button: Button = $PanelContainer/MarginContainer/VBoxContainer/RespawnButton
    button.connect("pressed", Connector.respawn)
