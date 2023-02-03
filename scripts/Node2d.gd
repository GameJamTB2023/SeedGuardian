extends Node2D

##Convention
# - Classes (nodes) use CamelCase
# - Variables and functions use snake_case
# - Constants use ALL_CAPS
# Declare member variables here.
var player
var enemies
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	add_enemies()
	get_player_details()

func add_enemies():
	pass # Add code to do this later

func get_player_details():
	pass # Add the code later

# Called every frame.
func _process(delta):
	process_inputs(delta)
	process_enemy_activity(delta)
	update_score()

func process_inputs(_delta):
	pass

func process_enemy_activity(_delta):
	pass

func update_score():
	pass

################################################################
################################################################
# SAMPLE FUNCTIONS
# Called when the node enters the scene tree for the first time.
#func _ready():
#	add(5, 6) # Prints 11 to Output window
#	var sum = get_sum(2, 4) # Sets sum to 6
#	var my_int = add_ints(sum, 4) # Sets my_int to 10
#	my_int = times_2(my_int) # sets my_int to 20
#	move_x(self, my_int) # Move this node 20 pixels along x axis
#	move_x(self) # Move by the default value

# This function has no return value
func add(a, b):
	print(a + b)

# This function returns a value
func get_sum(a, b):
	return a + b

# This function will only accept integer arguments
func add_ints(a: int, b: int):
	return a + b

# Generate an error if the return value is not an int
func times_2(n) -> int:
	return 2 * n

# This function modifies an object that is passed by reference
func move_x(node: Node2D, dx = 1.5):
	node.position.x += dx
