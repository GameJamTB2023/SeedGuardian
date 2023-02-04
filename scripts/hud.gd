extends CanvasLayer

signal start_game

var game_stats

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$Message.text = "Dodge the\nCreeps!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_start_button_pressed():
	$StartButton.hide()
	emit_signal("start_game")

func _on_message_timer_timeout():
	$Message.hide()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	game_stats = get_node("/root/game_stats")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Health.text = str(game_stats.health)

