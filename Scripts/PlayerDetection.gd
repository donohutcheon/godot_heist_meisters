extends "res://Scripts/Character.gd"


const FOV_TOLERANCE = 20
const MAX_DETECTION_RANGE = 320
const RED = Color(1, 0, 0, 1)
const WHITE = Color(1, 1, 1, 1)
onready var player = Global.player
var is_player_seen = false

func _ready():
	add_to_group("npc")

func _process(delta):
	if player_is_in_FOV_TOLERANCE() and is_player_seen:
		$Torch.color = RED
		get_tree().call_group("SuspicionMeter", "player_seen", delta)
	else:
		$Torch.color = WHITE

func _physics_process(delta):
	is_player_seen = player_is_in_los()

func player_is_in_FOV_TOLERANCE():
	var npc_facing_direction = Vector2(1, 0).rotated( global_rotation)
	var direction_to_player = (player.global_position - global_position).normalized()
	return abs(direction_to_player.angle_to(npc_facing_direction)) < deg2rad(FOV_TOLERANCE)


func player_is_in_los():
	var space = get_world_2d().direct_space_state
	var los_obstacle = space.intersect_ray(global_position, player.global_position, [self], collision_mask)
	var distance_to_player = player.global_position.distance_to(global_position)
	var player_in_range = distance_to_player < MAX_DETECTION_RANGE
	if !los_obstacle.has("collider"):
		print (los_obstacle)
	return (los_obstacle.has("collider") && los_obstacle.collider == player) and player_in_range

func night_vision_mode():
	$Torch.hide();
	
func dark_vision_mode():
	$Torch.show();