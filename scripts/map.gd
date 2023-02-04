extends Node2D

signal collectible_picked_up
var ammunition: int = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	$Collectibles/Collectible.collectible_picked_up.connect(pickup_collectible)
	$Collectibles/Collectible2.collectible_picked_up.connect(pickup_collectible)
	$Collectibles/Collectible3.collectible_picked_up.connect(pickup_collectible)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func pickup_collectible(amount: int):
	ammunition += amount
	print("New ammunition count")
	print(ammunition)
	emit_signal("collectible_picked_up")
