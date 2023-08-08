extends State
class_name JumpState

@export var character: TogglePlayer

func enter() -> void:
	print("jumping")
	character.velocity.y = character.jumpSpeed


func update(delta: float) -> void:
	if character.velocity.y >= 0:
		Transitioned.emit("FallState")
	
	elif Input.is_action_just_released("ui_up"):
		character.velocity.y = 0
		Transitioned.emit("FallState")


func physicsUpdate(delta: float) -> void:
	character.hearInputMoveDirection(delta)
