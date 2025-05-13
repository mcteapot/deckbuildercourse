extends CardState

const MOUSE_Y_SNAPBACK_THRESHOLD := 138


func enter() -> void:
	card_ui.color.color = Color.WEB_PURPLE
	card_ui.state.text = "Aiming"
	card_ui.targets.clear()
	# Calulate card offset in hand
	var offset := Vector2(card_ui.parent.size.x / 2, -card_ui.size.y / 2)
	offset.x -= card_ui.size.x / 2
	card_ui.animate_to_position(card_ui.parent.global_position + offset, 0.2)
	card_ui.drop_point_detector.monitoring = false
	# Call event buss of when ariving at aiming state, aim started siginal has started, so listners can respond
	Events.card_aim_started.emit(card_ui)
	
func exit() -> void:
	# Call event buss to have ended
	Events.card_aim_ended.emit(card_ui)
	
func on_input(event: InputEvent) -> void:
	var mouse_motion := event is InputEventMouseMotion
	var mouse_at_bottom := card_ui.get_global_mouse_position().y > MOUSE_Y_SNAPBACK_THRESHOLD
	
	if(mouse_motion and mouse_at_bottom) or event.is_action_pressed("right_mouse"):
		transition_requested.emit(self, CardState.State.BASE)
	elif event.is_action_released("left_mouse") or event.is_action_pressed("left_mouse"):
		get_viewport().set_input_as_handled()
		# Return to state for self
		transition_requested.emit(self, CardState.State.RELEASED)
	
