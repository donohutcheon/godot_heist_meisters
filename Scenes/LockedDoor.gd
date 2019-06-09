extends "res://Scripts/Door.gd"

var combination

func _ready():
	$Label.hide()

func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and is_player_in_range:
		$CanvasLayer/NumberPad.popup_centered();

func _on_Door_body_exited(body):
	if body == Global.player:
		is_player_in_range = false
	$CanvasLayer/NumberPad.hide()

func _on_NumberPad_combination_correct():
	open()

func _on_Computer_combination(combination, lock_group):
	self.combination = combination
	$CanvasLayer/NumberPad.combination = combination
	$Label.rect_rotation = -rotation_degrees
	$Label.text = lock_group

func _on_ExitDetection_body_entered(body):
	open()
	
func night_vision_mode():
	$Label.show()

func dark_vision_mode():
	$Label.hide()
