extends RigidBody2D

@export var enemy_bullets: PackedScene

var bullet_spawn: Marker2D

func _ready():
	bullet_spawn = $EnemyBulletSpawn

func _process(delta):
	pass

func _on_timer_timeout():
	print("test122")
	var bullet_instance2 = enemy_bullets.instantiate()
	bullet_instance2.position = bullet_spawn.get_global_position()
	bullet_instance2.rotation_degrees = rotation_degrees
	bullet_instance2.direction = Vector2(1.0,0.0).rotated(rotation).normalized()
	get_tree().get_root().call_deferred("add_child", bullet_instance2)
