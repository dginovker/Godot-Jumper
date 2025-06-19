extends RigidBody2D
class_name Player

@onready var arm = $ArmNode2D
@onready var power_sprite = $ArmNode2D/PowerArmSprite2D
var power = 0
var was_pressed = false

func _ready():
    Connector.register_player(self)

func _process(delta: float) -> void:
    var is_pressed = Input.is_physical_key_pressed(KEY_SPACE)
    
    if is_pressed:
        power = min(power + delta * 300, 400)
    elif was_pressed:  # Just released
        apply_impulse(Vector2.from_angle(arm.rotation + PI/2) * power)
        power = 0
    
    was_pressed = is_pressed
    
    # Power visualization
    var power_ratio = power / 400.0
    power_sprite.scale = Vector2(power_ratio, power_ratio)
    power_sprite.modulate = Color.RED  # Make it red so it's distinct
    
