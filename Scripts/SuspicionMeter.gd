extends TextureProgress

var suspicion = 0
export var suspicion_step = 1
export var suspicion_dropoff = 0.1

func _ready():
	value = suspicion

func _process(delta):
	suspicion -= suspicion_dropoff
	suspicion = clamp(suspicion, 0, max_value)
	value = suspicion

func player_seen(delta):
	suspicion += suspicion_step
	if suspicion >= max_value:
		end_game()

func end_game():
	get_tree().quit()