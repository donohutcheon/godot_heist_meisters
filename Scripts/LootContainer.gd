extends NinePatchRect

func _ready():
	visible = false;

func collect_loot():
	visible = true
	$VBoxContainer/LootList.add_icon_item(load(Global.breifcase_sprite), false)
	
	