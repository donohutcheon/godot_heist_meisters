extends CanvasModulate

const DARK = Color("0d0d0d")
const NIGHT_VISION = Color("19ff00")

func _ready():
	add_to_group("interface")
	color = DARK

func night_vision_mode():
	color = NIGHT_VISION
	$AudioStreamPlayer.stream = load(Global.night_vision_on_sfx);
	play_sfx()

func dark_vision_mode():
	color = DARK
	$AudioStreamPlayer.stream = load(Global.night_vision_off_sfx);
	play_sfx()
	

func play_sfx():
	$AudioStreamPlayer.play()
