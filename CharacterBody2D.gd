extends CharacterBody2D

@export var speed = 600
@export var bullet_scene: PackedScene

var bullet_spawn: Marker2D
var game_stats

func _process(delta):
	if game_stats.game_state_running == true:
		look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("fire"):
		if game_stats.ammo > 0:
			game_stats.ammo -= 1
			var bullet_instance = bullet_scene.instantiate()
			bullet_instance.position = bullet_spawn.get_global_position()
			bullet_instance.rotation_degrees = rotation_degrees
			bullet_instance.direction = Vector2(1.0,0.0).rotated(rotation).normalized()
			get_tree().get_root().call_deferred("add_child", bullet_instance)

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	if game_stats.game_state_running == true:
		get_input()
		move_and_slide()
	
func _ready():
	bullet_spawn = $BulletSpawn
	game_stats = get_node("/root/game_stats")
	
func hit_by_enemy(enemy: Node2D):
	game_stats.health = game_stats.health - 1
	enemy.queue_free()




func _on_interact_area_body_entered(body: Node2D):
	if body.get_meta("object_type") == "ammunition":
		print("FOUND ammunition")
		body.queue_free()
	elif body.get_meta("object_type") == "enemy":
		print("FOUND enemy")
		hit_by_enemy(body)
	else:
		print("FOUND unknown")
		print(body.get_meta("object_type"))
