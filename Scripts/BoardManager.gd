extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var board = [
			[2,1,2,3],
			[1,2,3,4],
			[2,3,4,1],
			[3,4,1,4]
			]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func Is_Selection_In_Range(selection:Vector2):
	return (selection.x >= 0 && selection.x <= (board.size() - 1)) && (selection.y >= 0 && selection.y <= (board[selection.x].size() - 1))

# Checks if both selections are adjacent. Returns true if adjacent.
func Is_Selection_Adjecent(firstSelection:Vector2, secondSelection:Vector2):
	var adjacentTop = (secondSelection == (firstSelection + Vector2(0, -1)))
	var adjacentBottom = (secondSelection == (firstSelection + Vector2(0, 1)))
	var adjacentLeft = (secondSelection == (firstSelection + Vector2(-1, 0)))
	var adjacentRight = (secondSelection == (firstSelection + Vector2(1, 0)))
	
	return (adjacentTop || adjacentBottom || adjacentLeft || adjacentRight)

# Finds and return the first tile on the board with that ID
func FindTileID(tileID):
	for i in range(board.size()):
		for j in range(board[i].size()):
			if(board[i][j] == tileID):
				return Vector2(i, j)

# Takes a random location on the board and request a bomb spawn
func GenerateBomb():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	SpawnBomb(Vector2(rng.randi_range(0, 3),rng.randi_range(0, 3)))

# Spawns the bomb
func SpawnBomb(bombPosition:Vector2):
	if(Is_Selection_In_Range(bombPosition)):
		board[bombPosition.x][bombPosition.y] = 5
	pass

# Explode the bomb and tiles around it
func DetonateBomb():
	var bombPosition:Vector2 = FindTileID(5)
	board[bombPosition.x][bombPosition.y] = 0

# Generate IDs for tiles that are empty (TileID 0)
func FillEmptyTiles():
	var rng = RandomNumberGenerator.new()

	for i in range(board.size()):
		for j in range(board[i].size()):
			if(board[i][j] == 0):
				rng.randomize()
				board[i][j] = rng.randi_range(1, 4)
