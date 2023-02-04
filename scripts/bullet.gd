extends Area2D
@export var bullet_speed = 1000
var direction: Vector2 = Vector2(1.0, 0.0)
func _process(delta):
	position = position + bullet_speed * direction * delta
	
