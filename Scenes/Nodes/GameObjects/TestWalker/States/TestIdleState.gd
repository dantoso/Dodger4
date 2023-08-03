extends State
class_name TestIdleState

@export var character: CharacterBody2D
var timer: float

func enter() -> void:
	timer = 3.0

func update(delta: float) -> void:
	if timer > 0:
		timer -= delta
	else:
		Transitioned.emit("WalkState")

func physicsUpdate(delta: float) -> void:
	character.velocity = Vector2.ZERO
