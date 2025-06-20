extends Node2D
class_name Water

@export var speed: int = 1

func _ready():
    $Area2D.body_entered.connect(_on_body_entered)
    Connector.register_water(self)
    
func _process(delta: float) -> void:
    # Move the body
    global_position.y -= delta * speed * 100

func _on_body_entered(body: Node2D) -> void:
    if not body.is_in_group("player"):
        return
    Connector.death()
    print("You died!")
