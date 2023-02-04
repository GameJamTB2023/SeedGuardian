extends Area2D
@export var bullet_speed = 1000

var direction: Vector2 = Vector2(1.0, 0.0)
func _process(delta):
	position = position + bullet_speed * direction * delta

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	queue_free()
