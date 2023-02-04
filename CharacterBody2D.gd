extends CharacterBody2D

@export var speed = 400


@export var bullet_scene: PackedScene



func _process(delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("fire"):
		var bullet_instance = bullet_scene.instantiate()
		bullet_instance.position = get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.direction = Vector2(1.0,0.0).rotated(rotation).normalized()
		get_tree().get_root().call_deferred("add_child", bullet_instance)

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()



