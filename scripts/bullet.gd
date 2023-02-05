extends Area2D
@export var bullet_speed = 1000

var direction: Vector2 = Vector2(1.0, 0.0)
var game_stats

func _ready():
	game_stats = get_node("/root/game_stats")

func _process(delta):
	position = position + bullet_speed * direction * delta

func _on_body_entered(body):
	if body.get_meta("object_type") == "enemy":
		game_stats.score += 1
		print("FOUND enemy")
		body.health = body.health - 1
		if body.health <= 0:
			body.call_deferred("queue_free")
	else:
		print("FOUND unknown")
	call_deferred("queue_free")


func _on_timer_timeout():
	print("delete bullet")
	call_deferred("queue_free")
