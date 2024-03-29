extends Area2D

var is_player_in_range = false

func _on_Door_body_entered(body):
	if body.is_class("KinematicBody2D"):
		if body != Global.player and not $AnimationPlayer.is_playing():
			open()
		else:
			is_player_in_range = true

func _on_Door_body_exited(body):
	if body == Global.player:
		is_player_in_range = false

func open():
	$AnimationPlayer.play("open")
	
func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and is_player_in_range:
		open()