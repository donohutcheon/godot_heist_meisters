extends Popup
const KEYPAD_DISPLAY_TIME = 0.2
var combination = []
var input = []
onready var display = $VSplitContainer/DisplayContainer/Display
onready var light_indicator = $VSplitContainer/ButtonContainer/ButtonGrid/LightIndicator
onready var access_granted_indicator = load(Global.access_granted_indicator_resource)
onready var access_denied_indicator = load(Global.access_denied_indicator_resource)
onready var button_click_beep = load("res://SFX/threeTone1.ogg")
onready var keypad_access_denied_beep = load("res://SFX/twoTone1.ogg")

signal combination_correct

func _ready():
	connect_buttons()
	reset_lock()

func _on_button_pressed(button):
	if button == "OK":
		check_input();
	else:
		enter(int(button))

func check_input():
	if input == combination:
		light_indicator.texture = access_granted_indicator
		$Timer.start(KEYPAD_DISPLAY_TIME)
	else:
		reset_lock()
		$KeypadSoundEffects.stream = keypad_access_denied_beep
		$KeypadSoundEffects.play()
	

func enter(digit):
	input.append(digit)
	update_display()

func reset_lock():
	display.clear()
	input.clear()

func update_display():
	display.bbcode_text = "[center]" + PoolStringArray(input).join("") + "[/center]"
	$KeypadSoundEffects.stream = button_click_beep
	$KeypadSoundEffects.play()
	if input.size() == combination.size():
		check_input()

func connect_buttons():
	for button in $VSplitContainer/ButtonContainer/ButtonGrid.get_children():
		if button is Button:
			button.connect("pressed", self, "_on_button_pressed", [button.text])

func _on_Timer_timeout():
	emit_signal("combination_correct")
	reset_lock()
	hide()

func _on_NumberPad_about_to_show():
	light_indicator.texture = access_denied_indicator
	reset_lock()
