extends Node
class_name State

signal transitionTo(newState: State)

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(delta: float) -> void:
	pass

func physicsUpdate(delta: float) -> void:
	pass

func handleInput(event: InputEvent) -> void:
	pass
