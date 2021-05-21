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
