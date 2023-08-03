extends State
class_name TestWalkState

@export var character: CharacterBody2D
var timer: float

func enter() -> void:
	timer = 3.0

func update(delta: float) -> void:
	if timer > 0:
		timer -= delta
	else:
		Transitioned.emit("IdleState")

func physicsUpdate(delta: float) -> void:
	character.velocity.x = 50
