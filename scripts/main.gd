extends Node

@export var mob_scene: PackedScene
var score: int

var game_stats

# Called when the node enters the scene tree for the first time.
func _ready():
	game_stats = get_node("/root/game_stats")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func new_game():
	game_stats.game_state_running = true
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	get_tree().call_group("mobs", "queue_free")
	
func end_game():
	game_stats.game_state_running = false
	$HUD.show_game_over()
	
func _on_ScoreTimer_timeout():
	$HUD.update_score(score)
	

