extends Node2D
@export var collectible_spawn: PackedScene

signal collectible_picked_up

var ammunition: int = 10

func _ready():
	var rand = RandomNumberGenerator.new()
	var screen_size = get_viewport().get_visible_rect().size
	
	for i in range(1, 10):
		var collectible = collectible_spawn.instantiate()
		add_child(collectible)
		var area = $full_map
		var position = area.position + Vector2(randf() * area.size.x, randf() * area.size.y)
		
	$Collectibles/Collectible3.collectible_picked_up.connect(pickup_collectible)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func pickup_collectible(amount: int):
	ammunition += amount
	print("New ammunition count")
	print(ammunition)
	emit_signal("collectible_picked_up")
