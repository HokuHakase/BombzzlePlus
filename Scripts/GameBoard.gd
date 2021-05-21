extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	# set_cell(1, 1, 2)
	update_tile_map()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_tile_map():
	print(BoardManager.board.size())
	for i in range(BoardManager.board.size()):
		for j in range(BoardManager.board[i].size()):
			set_cell(i+1, j+1, BoardManager.board[i][j])
