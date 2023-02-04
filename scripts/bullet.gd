extends Area2D
@export var bullet_speed = 1000

var direction: Vector2 = Vector2(1.0, 0.0)


func _process(delta):
	position = position + bullet_speed * direction * delta

func _on_body_entered(body):
	if body.get_meta("object_type") == "enemy":
		print("FOUND enemy")
		body.health = body.health - 1
		if body.health <= 0:
			body.queue_free()
	else:
		print("FOUND unknown")
		print(body.get_meta("object_type"))
	queue_free()
