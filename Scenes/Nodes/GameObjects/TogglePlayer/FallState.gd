extends State
class_name FallState

@export var character: TogglePlayer

func enter() -> void:
	print("falling")


func update(delta: float) -> void:
	if character.is_on_floor():
		print("FLOOR")
		Transitioned.emit("RunState")


func physicsUpdate(delta: float) -> void:
	character.hearInputMoveDirection(delta)
