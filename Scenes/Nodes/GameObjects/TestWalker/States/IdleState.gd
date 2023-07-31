extends State
class_name IdleState

@export var character: CharacterBody2D
var timer: float

func enter() -> void:
	timer = 3.0

func update(delta: float) -> void:
	if timer > 0:
		print(self.name + ": " + "idling")
		timer -= delta
	else:
		print(self.name + ": " + "changing")
		Transitioned.emit("WalkState")

func physicsUpdate(delta: float) -> void:
	character.velocity = Vector2.ZERO
