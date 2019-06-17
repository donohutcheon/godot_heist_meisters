extends Area2D

func _on_Briefcase_body_entered(body):
	Global.player.collect_briefcase()
	queue_free()
	get_tree().call_group("interface", "collect_loot")
