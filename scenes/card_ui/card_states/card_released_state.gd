extends CardState

var played: bool


func enter() -> void:
	card_ui.color.color = Color.DARK_VIOLET
	card_ui.state.text = "Released"

	played = false

	if not card_ui.targets.is_empty():
		played = true
		print("Played card: ", card_ui.targets)

func on_input(event: InputEvent) -> void:
	if played:
		return

	# transation to base state
	transition_requested.emit(self, CardState.State.BASE)