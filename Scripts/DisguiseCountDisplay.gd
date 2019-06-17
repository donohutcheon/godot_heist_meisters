extends ItemList

func update_disguises(number):
	clear()
	for i in range(number):
		add_icon_item(load(Global.box_sprite), false)

func on_player_disguised(remaining_disguises):
	update_disguises(remaining_disguises)