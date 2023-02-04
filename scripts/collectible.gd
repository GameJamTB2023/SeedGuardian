extends Area2D

signal collectible_picked_up

@export var amount: int = 1
var game_stats

func _ready():
	game_stats = get_node("/root/game_stats")
	
func _process(delta):
	pass


func _on_collect_area_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	game_stats.ammo += 1
	print("Collecting ammo")
	emit_signal('collectible_picked_up', amount)
	queue_free()
