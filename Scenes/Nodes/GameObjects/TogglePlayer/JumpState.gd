extends State
class_name JumpState

@export var character: TogglePlayer

func enter() -> void:
	character.velocity.y = character.jumpSpeed


func update(delta: float) -> void:
	if character.is_on_floor():
		Transitioned.emit("RunState")


func physicsUpdate(delta: float) -> void:
	character.hearInputMoveDirection()
