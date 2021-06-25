extends Label



func _on_TurnManager_new_phase_start(newGamePhase):
	text = "Current phase: " + str(newGamePhase)
