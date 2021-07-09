extends Node

# rng variables
var rng = RandomNumberGenerator.new()

# Score variables
var scoreCurrent = 0

# Bonus / Penalty variables
var bonusTileID = 0
var penaltyTileID = 0

# Signals
signal bonus_tile_changed(newTileID)
signal penalty_tile_changed(newTileID)

func GenerateBonusPenaltyTiles():
	SelectBonusTile()
	SelectPenaltyTile()

# Selects a random tile to be the bonus tile.
# By default, prevents the tile to be the same as the penalty tile
func SelectBonusTile(allowDuplicate:bool = false):
	var bonusTileID = SelectTileID(0)
	emit_signal("bonus_tile_changed",bonusTileID)

# Selects a random tile to be the penalty tile.
# By default, prevents the tile to be the same as the bonus tile
func SelectPenaltyTile(allowDuplicate:bool = false):
	var penaltyTileID = SelectTileID(1)
	emit_signal("penalty_tile_changed",penaltyTileID)

# Selects a Tile ID and checks if it is a duplicate
# targetTile: 0 = Bonus, 1 = Penalty
# BUG: Selected tiles are sometimes the same even when allowDuplicate = false
func SelectTileID(targetTile:int = 0, allowDuplicate:bool = false):
	var selectedTileID = GetRandomTileID()
	if (!allowDuplicate):
		if ((targetTile == 0 && penaltyTileID == selectedTileID) || (targetTile == 1 && bonusTileID == selectedTileID)):
			if (selectedTileID >= 4):
				selectedTileID -= 1
			else:
				selectedTileID += 1
	return selectedTileID

# TODO: Make it less reliable on random number generation
func GetRandomTileID():
	rng.randomize()
	return rng.randi_range(1, 4)
