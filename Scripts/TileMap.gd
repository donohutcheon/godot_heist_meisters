extends TileMap

func _init():
	var tileSet1Coord = Vector2()
	var lightPoly1 = tile_set.autotile_get_light_occluder(0, Vector2(4, 6))
	var poly = [0,1,2,3]
	var navPoly = NavigationPolygon.new()
	
	for h in range(4):
		var iconCoord = tile_set.autotile_get_icon_coordinate(0)
		var originCoord = iconCoord - Vector2(6,3)
		for i in range(9):
			for j in range(6):
				var polyArr = [Vector2(0, 0), Vector2(0, 64), Vector2(64, 64), Vector2(64, 0)]
				var occluderPoly = OccluderPolygon2D.new()
				occluderPoly.set_polygon(polyArr)
#				occluderPoly.polygon.append(Vector2(0, 0))
#				occluderPoly.polygon.append(Vector2(0, 64))
#				occluderPoly.polygon.append(Vector2(64, 64))
#				occluderPoly.polygon.append(Vector2(64, 0))
				var coord = Vector2(i, j) + originCoord
				tile_set.autotile_set_light_occluder(h, occluderPoly, coord) 

