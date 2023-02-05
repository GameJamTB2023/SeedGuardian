extends StaticBody2D

var health = 1
var enemy_speed = 100
var direction

@export var enemy_bullets: PackedScene

var bullet_spawn: Marker2D
# Called when the node enters the scene tree for the first time.
func _ready():
	bullet_spawn = $Marker
	$AnimatedSprite2d.play()
	var mob_types = $AnimatedSprite2d.get_sprite_frames().get_animation_names()
	$AnimatedSprite2d.animation = mob_types[randi() % mob_types.size()]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position + enemy_speed * direction * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_timer_timeout():
	var bullet_instance2 = enemy_bullets.instantiate()
	bullet_instance2.position = bullet_spawn.get_global_position()
	bullet_instance2.rotation_degrees = rotation_degrees
	bullet_instance2.direction = Vector2(1.0,0.0).rotated(rotation).normalized()
	get_tree().get_root().call_deferred("add_child", bullet_instance2)