extends Node

# Board Input détecte le clic de la souris, traduit la position de celle-ci
# en position sur la Tile Map puis émet un event avec celui-ci

var currentSelection = Vector2.ZERO # Si la variable est ZERO, aucune tuile est sélectionné

func _ready():
	pass

#func _process(delta):
#	pass

func _input(event):
	if event.is_action_pressed("ui_leftClick"):
		print("Clic de la souris à: ", event.position)
		var targetSelection = get_node("../GameBoard").world_to_map(event.position)
		var targetSelectionMinusOne = Vector2(targetSelection.x-1, targetSelection.y-1)
		print("Position sur la tile map: ", targetSelection)
		print("Position moins un: ", targetSelectionMinusOne)
		
		if currentSelection == Vector2.ZERO: # Si la sélection est vide (0, 0)
			if BoardManager.Is_Selection_In_Range(targetSelectionMinusOne):
				currentSelection = targetSelection
				print("La sélection est maintenant ", currentSelection)
		else:
			if currentSelection == targetSelection:
				currentSelection = Vector2.ZERO
				print("Sélection réinitialisée")
			else:
				if BoardManager.Is_Selection_In_Range(targetSelectionMinusOne):
					if BoardManager.Is_Selection_Adjecent(currentSelection, targetSelection):
						var firstSelectionID = BoardManager.board[currentSelection.x - 1][currentSelection.y - 1]
						var secondSelectionID = BoardManager.board[targetSelection.x - 1][targetSelection.y - 1]
				
						BoardManager.board[currentSelection.x - 1][currentSelection.y - 1] = secondSelectionID
						BoardManager.board[targetSelection.x - 1][targetSelection.y - 1] = firstSelectionID
						get_node("../GameBoard").update_tile_map()
				
						currentSelection = Vector2.ZERO
	pass # Replace with function body.
