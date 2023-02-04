extends Area2D

signal collectible_picked_up

@export var amount: int = 1


func _ready():
	pass
	
func _process(delta):
	pass


func _on_collect_area_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("Collecting ammo")
	emit_signal('collectible_picked_up', amount)
	queue_free()
