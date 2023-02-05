extends Node2D
@export var collectible_spawn: PackedScene
var game_stats
signal collectible_picked_up

func _ready():
	game_stats = get_node("/root/game_stats")

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
	if(game_stats.collectible < 10):
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var num = rng.randi_range(1, 4)
		if(num == 1):
			spawn_ammo($CollectibleSpawnAreas/CollectibleSpawnArea, 1)
		elif(num == 2):
			spawn_ammo($CollectibleSpawnAreas/CollectibleSpawnArea2, 1)
		elif(num == 3):
			spawn_ammo($CollectibleSpawnAreas/CollectibleSpawnArea3, 1)
		elif(num == 4):
			spawn_ammo($CollectibleSpawnAreas/CollectibleSpawnArea4, 1)
		game_stats.collectible += 1
		print(game_stats.collectible)
		

func pickup_collectible(amount: int):
	print("New ammunition count")
	emit_signal("collectible_picked_up")
