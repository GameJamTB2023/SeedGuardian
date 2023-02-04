extends Node

func _ready():
	print("hi")
	var rand = RandomNumberGenerator.new()
	var collectibleyscene = load("res://scenes/collectible.tscn")
	
	var screen_size = get_viewport().get_visible_rect().size
	for i in range(0, 5):
		var collectible = collectibleyscene.instance()
		rand.randomize()
		var x = rand.randf_range(0, screen_size.x)
		rand.randomize()
		var y = rand.randf_range(0, screen_size.y)
		collectible.position.y = y
		collectible.position.x = x
		add_child(collectible)
	
