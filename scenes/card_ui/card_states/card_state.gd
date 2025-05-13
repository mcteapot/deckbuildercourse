class_name CardState
extends Node

# CardState is a base class for all card states in the card game.
enum State {
	BASE,
	CLICKED,
	DRAGGING,
	AIMING,
	RELEASED,
	DISABLED,
}

signal transition_requested(from: CardState, to: State)

@export var state: State

var card_ui: CardUI

func enter() -> void:
	pass

func exit() -> void:
	pass

func  on_input(event: InputEvent) -> void:
	pass

func on_gui_input(event: InputEvent) -> void:
	pass

func on_mouse_entered() -> void:
	pass

func on_mouse_exited() -> void:
	pass
