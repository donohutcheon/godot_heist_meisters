extends "res://Scripts/Character.gd"

const NIGHT_VISION_MAX_CHARGE = 10
const NIGHT_VISION_MIN_USE_CHARGE = 4
const NIGHT_VISION_RECHARGE_RATE = 1
const NIGHT_VISION_DISCHARGE_RATE = 2

var motion = Vector2()
enum VISION_MODES {DARK, NIGHT_VISION}
var vision_mode = VISION_MODES.DARK
var vision_change_on_cooldown = false
var night_vision_charge = 0

func _ready():
	Global.player = self
	vision_mode = VISION_MODES.DARK
	
func _process(delta):
	update_motion(delta)
	update_vision_mode(delta)
	move_and_slide(motion)
	
func update_motion(delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
		motion.y = clamp((motion.y - SPEED), -MAX_SPEED, 0)
	elif Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
		motion.y = clamp((motion.y + SPEED), 0, MAX_SPEED)	
	else:
		motion.y = lerp(motion.y, 0, FRICTION)

	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = clamp((motion.x - SPEED), -MAX_SPEED, 0)
	elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = clamp((motion.x + SPEED), 0,  MAX_SPEED)	
	else:
		motion.x = lerp(motion.x, 0, FRICTION)
	
func _input(event):
	if Input.is_action_just_pressed("ui_vision_mode_change") and (night_vision_charge > NIGHT_VISION_MIN_USE_CHARGE):
		cycle_vision_mode()

func cycle_vision_mode():
	match vision_mode:
		VISION_MODES.DARK:
			get_tree().call_group("interface", "night_vision_mode")
			get_tree().call_group("npc", "night_vision_mode")
			get_tree().call_group("security", "night_vision_mode")
			vision_mode = VISION_MODES.NIGHT_VISION
		VISION_MODES.NIGHT_VISION:
			get_tree().call_group("interface", "dark_vision_mode")
			get_tree().call_group("npc", "dark_vision_mode")
			get_tree().call_group("security", "dark_vision_mode")
			vision_mode = VISION_MODES.DARK

func _on_VisionModeTimer_timeout():
	vision_change_on_cooldown = false
	get_tree().call_group("interface", "dark_vision_mode")
	vision_mode = VISION_MODES.DARK
	Global.night_vision_timer.stop()

func update_vision_mode(delta):
	match vision_mode:
		VISION_MODES.DARK:
			night_vision_charge = clamp(night_vision_charge  + (NIGHT_VISION_RECHARGE_RATE * delta), 0, NIGHT_VISION_MAX_CHARGE);
		VISION_MODES.NIGHT_VISION:
			night_vision_charge = clamp(night_vision_charge  - (NIGHT_VISION_DISCHARGE_RATE * delta), 0, NIGHT_VISION_MAX_CHARGE);
			if night_vision_charge == 0:
				cycle_vision_mode()