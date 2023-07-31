extends Node
class_name State

signal Transitioned(newStateName: String)

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(delta: float) -> void:
	pass

func physicsUpdate(delta: float) -> void:
	pass
