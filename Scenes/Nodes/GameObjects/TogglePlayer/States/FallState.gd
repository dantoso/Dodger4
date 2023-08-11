extends State
class_name FallState

@export var character: CharacterBody2D

func enter() -> void:
	print("falling")


func update(delta: float) -> void:
	if character.velocity.y == 0:
		transitionTo.emit($"../RunState")
