extends RigidBody2D

@onready var CollisionShape:= $CollisionShape2D
@onready var Sprite:= $ArmSprite2D

func _ready():
    CollisionShape.shape.size = Sprite.texture.get_size() * Sprite.scale
