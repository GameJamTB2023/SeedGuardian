extends Node2D

#Declaration of variables
var player
var enemies
var score


# Called when the node enters the scene tree for the first time.
func _ready():
	add_enemyies()
	get_player_details()
	
func get_player_details()
	# add code later

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	process_inputs(delta)
	process_enemy_activity(delta)
	update_score()
	
func process_inputs(delta:
	pass

func process_enemy_activity(delta):
	pass
	
func update_score()
	pass
