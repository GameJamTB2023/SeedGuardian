extends Node

@export var mob_scene: PackedScene
var score: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func new_game():
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	get_tree().call_group("mobs", "queue_free")

	
func end_game():
	$HUD.show_game_over()
	
func _on_ScoreTimer_timeout():
	$HUD.update_score(score)
	

