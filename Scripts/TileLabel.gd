extends Sprite

var TilePositions = [
						[0,0],
						[16,0],
						[32,0],
						[48,0],
						[16,16]
					]

func update_tile_label(tileID):
	var SelectedTilePosition = TilePositions[tileID]
	var CurrentRect = get_region_rect()
	CurrentRect.position = Vector2(SelectedTilePosition[0], SelectedTilePosition[1])
	set_region_rect(CurrentRect)
	#region_rect.size.x = SelectedTilePosition[0]
	#region_rect.size.y = SelectedTilePosition[1]
