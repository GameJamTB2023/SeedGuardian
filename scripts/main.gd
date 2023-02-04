extends Node

@export var mob_scene: PackedScene
var score: int

var game_stats

# Called when the node enters the scene tree for the first time.
func _ready():
	game_stats = get_node("/root/game_stats")
	# new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func new_game():
	game_stats.game_state_running = true
	$HUD.update_score(score)
	score = 0
	# $Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.show_message("Get Ready")
	get_tree().call_group("mobs", "queue_free")
	
func end_game():
	game_stats.game_state_running = false
	$HUD.show_game_over()
	$ScoreTimer.stop()
	$MobTimer.stop()
	
func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()


func _on_score_timer_timeout():
		score += 1


func _on_mob_timer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randi()

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	mob.direction = Vector2(1.0,0.0).rotated(direction).normalized()

	# Choose the velocity for the mob.
	#var new_velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	#mob.velocity = new_velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
