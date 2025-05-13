class_name Card
extends Resource

#Card Type from Slay The Spier
enum Type{ATTACK, SKILL, POWER}

#Target of how the card can interact with board
enum Target {SELF, SINGLE_ENEMY, ALL_ENEMIES, EVERYONE}


@export_group("Card Attributes")
@export var id: String
@export var type: Type
@export var target : Target

func is_single_targeted() -> bool:
	return target == Target.SINGLE_ENEMY
