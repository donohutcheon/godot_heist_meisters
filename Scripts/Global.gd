extends Node

var player
var navigation
var destinations
var night_vision_timer

#Asset Links
var night_vision_on_sfx = "res://SFX/nightvision.wav"
var night_vision_off_sfx = "res://SFX/nightvision_off.wav"

var access_granted_indicator_resource = "res://GFX/Interface/PNG/dotGreen.png"
var access_denied_indicator_resource = "res://GFX/Interface/PNG/dotRed.png"

var box_sprite = "res://GFX/PNG/Tiles/tile_129.png"
var player_sprite = "res://GFX/PNG/Hitman 1/hitman1_stand.png"
var box_occluder = "res://Scenes/Characters/BoxOccluder.tres"
var player_occluder = "res://Scenes/Characters/CharacterOccluder.tres"
var box_collision_shape = "res://Scenes/Characters/BoxCollisionShape.tres"
var player_collision_shape = "res://Scenes/Characters/PlayerCollisionShape.tres"

var breifcase_sprite = "res://GFX/Loot/suitcase.png"