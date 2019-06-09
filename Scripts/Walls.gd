extends TileMap

func _init():
	for i in range(9):
		for j in range(6):
			var coord = Vector2(i, j)
			#var nav_poly = tile_set.autotile
			#tile_set.clear()
			print(tile_set.get_tiles_ids())
			
			var occluder_poly = tile_set.autotile_get_light_occluder(1, coord)
			#print(nav_poly)
			#if nav_poly:
			#	nav_poly.clear_outlines()
			#	nav_poly.clear_polygons()
			#occluder_poly.polygon = []
			#print(occluder_poly.polygon)
			#tile_set.autotile_clear_bitmask_map(0)

			#tile_set.autotile_clear_bitmask_map(1)

	
	
		