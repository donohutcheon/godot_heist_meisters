extends Node2D

var checkpoints = {}
var tutorial_progress = 0

var instructions = ["Use [color=red]W,A,S,D[/color] keys to move around. If you don't stuff this up we'll have more heists for you to carry out.",
	"Use [color=red]spacebar[/color] to activate your night vision. Use it wisely, it takes a long time to charge but it discharges quickly!",
	"You need to avoid being seen by the security cameras.  Suspicion increases fast but dissipates slowly. If you build up too much suspicion - you are done for!", 
	"Use the [color=red]E[/color] key to disguise yourself. Use your disguises wisely, you only have a limited amount.",
	"Use the [color=red]left mouse button[/color] to open doors when you are near to them.", 
	"Security guards are lazy and unmotivated but you still need to avoid being caught.", 
	"Goto that computer on the far end of the room!",
	"Use [color=red]left[/color] mouse button on computers to hack into them and trick the security administrator into resetting the access codes. The access codes will get you into restricted areas.  Make sure to memorize the code!", 
	"I really hope you memorized the access code?  If not, you better go back! Otherwise punch the code in to unlock the door.", 
	"Open this door, the other one is locked.",
	"Grab that briefcase! There is one more locked door to get through, so get the access code from the computer and make your escape!",
	"Great but hurry up! Did you get the code from the computer? Let's move it man! Move into the exit area to make your escape!",
	"Hurry! Enter the access code!",
	"Move to the exit and lets get to the next heist!"]

func _ready():
	for checkpoint in $TutorialInstructions.get_children():
		checkpoints[checkpoint.tutorial_index] = checkpoint
		if checkpoint.tutorial_index != 0:
			checkpoint.visible = false

func display_instruction(tutorial_checkpoint, tutorial_index):
	#tutorial_progress
	print("index: %d"%[tutorial_index])
	if tutorial_progress == tutorial_index:
		$CanvasLayer/InstructionsPopup.set_text(instructions[tutorial_progress])
		$CanvasLayer/InstructionsPopup.display_popup()
		self.tutorial_progress += 1
		if checkpoints.has(tutorial_progress):
			checkpoints[tutorial_progress].visible = true
			$Tween.interpolate_property($ObjectiveCheckpoint, "position", tutorial_checkpoint.position, checkpoints[tutorial_progress].position, 5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
			$Tween.start()
		tutorial_checkpoint.queue_free()
		

func _on_Timer_timeout():
	var tutorial_checkpoint = $TutorialInstructions/TutorialInstruction0
	display_instruction(tutorial_checkpoint, 0)

func on_tutorial_area_entered(tutorial_checkpoint, tutorial_index):
	display_instruction(tutorial_checkpoint, tutorial_index)

func _on_Tween_tween_all_completed():
	pass # Replace with function body.
