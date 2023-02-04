extends Node2D
@export var collectible_spawn: PackedScene
var game_stats
signal collectible_picked_up

func _ready():
	game_stats = get_node("/root/game_stats")
	spawn_ammo($CollectibleSpawnAreas/CollectibleSpawnArea, 5)
	spawn_ammo($CollectibleSpawnAreas/CollectibleSpawnArea2, 6)
	spawn_ammo($CollectibleSpawnAreas/CollectibleSpawnArea3, 6)
	spawn_ammo($CollectibleSpawnAreas/CollectibleSpawnArea4, 8)

func spawn_ammo(rect: ReferenceRect, count: int):
	var rand = RandomNumberGenerator.new()
	var spawn_size = rect.size
	var spawn_position = rect.get_global_position()
	for i in range(0, count):
		var collectible = collectible_spawn.instantiate()
		rand.randomize()
		var x = rand.randf_range(spawn_position.x, spawn_size.x + spawn_position.x)
		rand.randomize()
		var y = rand.randf_range(spawn_position.y, spawn_size.y + spawn_position.y)
		collectible.position.y = y
		collectible.position.x = x
		add_child(collectible)

func _process(delta):
	pass

func pickup_collectible(amount: int):
	print("New ammunition count")
	emit_signal("collectible_picked_up")
