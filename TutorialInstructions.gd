extends Area2D

export var tutorial_index = 0

func _on_TutorialInstructions_body_entered(body):
	get_tree().call_group("tutorial", "on_tutorial_area_entered", self, tutorial_index)