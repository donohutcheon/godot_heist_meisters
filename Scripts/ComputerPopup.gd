extends Popup

func set_text(combination):
	var text = PoolStringArray(combination).join("")
	$RichTextLabel.bbcode_text = "Will you stop forgetting your access code! I set it to [color=#00FF00]%s[/color].  This is the last time!"%text;
