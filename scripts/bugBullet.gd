extends Area2D

@export var bullet_speed = 1000

var direction: Vector2 = Vector2(1.0, 0.0)

func _process(delta):
	position = position + bullet_speed * direction * delta

func _on_body_entered(body):
	if body.get_meta("object_type") == "player":
		print("FOUND enemy")
		body.hit_by_enemy(self)
		call_deferred("queue_free")
	elif body.get_meta("object_type") == "enemy":
		return
	else:
		print("FOUND unknown")
		call_deferred("queue_free")


func _on_timer_timeout():
	print("delete bullet")
	call_deferred("queue_free")
