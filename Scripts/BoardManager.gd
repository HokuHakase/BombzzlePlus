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
