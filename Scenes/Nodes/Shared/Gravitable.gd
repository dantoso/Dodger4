extends CharacterBody2D
class_name Gravitable

@export var terminalVelocity: = 1000.0
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func applyGravity(delta: float) -> void:
	velocity.y = min(
		velocity.y + gravity*delta,
		terminalVelocity
	)
