extends Popup

func set_text(message):
	$RichTextLabel.bbcode_text = "[b][color=black]New Message[/color][/b]\n\n[color=blue]%s[/color]"%message;

func display_popup():
	$AudioStreamPlayer.play()
	self.popup_centered()