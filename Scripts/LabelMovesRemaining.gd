extends Label



func _on_TurnManager_move_used(moveRemaining):
	update_text(moveRemaining)


func _on_TurnManager_moves_reset(moveRemaining):
	update_text(moveRemaining)

func update_text(moveRemaining):
	text = "Remaining moves: " + str(moveRemaining)
