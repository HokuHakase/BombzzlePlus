extends Node

enum GamePhase {PHASE_BOMBDEPLOY, PHASE_BOMBTICKING, PHASE_BOMBEXPLODE}

# TODO: Add signals
# Signal that emits when a new phase start
signal new_phase_start(newGamePhase)
signal phase_bomb_ticking()
# Signal that emits when a move is used
signal move_used(moveRemaining)
signal moves_reset(moveRemaining)

# TODO: Add variables
# Variable that indicates the number of moves per phase (Array)
var movesPerPhase = [3, 6, 1]
# Variable that tracks the number of moves until the next phase
var movesRemaining
# Variable that indicates the current game phase
var gamePhaseCurrent

# Called when the node enters the scene tree for the first time.
func _ready():
	gamePhaseCurrent = GamePhase.PHASE_BOMBDEPLOY
	reset_moves_remaining()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func next_phase():
	match gamePhaseCurrent:
		GamePhase.PHASE_BOMBDEPLOY:
			gamePhaseCurrent = GamePhase.PHASE_BOMBTICKING
			emit_signal("phase_bomb_ticking")
		GamePhase.PHASE_BOMBTICKING:
			gamePhaseCurrent = GamePhase.PHASE_BOMBEXPLODE
		GamePhase.PHASE_BOMBEXPLODE:
			gamePhaseCurrent = GamePhase.PHASE_BOMBDEPLOY
	emit_signal("new_phase_start", gamePhaseCurrent)

func reset_moves_remaining():
	movesRemaining = movesPerPhase[gamePhaseCurrent]
	emit_signal("moves_reset", movesRemaining)

func consume_move():
	movesRemaining -= 1
	if (movesRemaining <= 0):
		print("No more moves! Moving to next phase.")
		next_phase()
		reset_moves_remaining()
	else:
		emit_signal("move_used", movesRemaining)
