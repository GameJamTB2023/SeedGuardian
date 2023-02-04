extends StaticBody2D

@export var amount: int = 1
var game_stats

func _ready():
	game_stats = get_node("/root/game_stats")
	
func _process(delta):
	pass
