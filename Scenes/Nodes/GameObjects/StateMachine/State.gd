extends Node
class_name State

signal transitionTo(newState: State)

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass

func physicsUpdate(_delta: float) -> void:
	pass

func handleInput(_event: InputEvent) -> void:
	pass
