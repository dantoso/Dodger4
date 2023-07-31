extends State
class_name WalkState

@export var character: CharacterBody2D
var timer: float

func enter() -> void:
	timer = 3.0

func update(delta: float) -> void:
	print("walking")
	timer -= delta
	if timer <= 0:
		Transitioned.emit("IdleState")

func physicsUpdate(delta: float) -> void:
	character.velocity.x += 20
