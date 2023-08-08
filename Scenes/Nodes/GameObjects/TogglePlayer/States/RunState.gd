extends State
class_name RunState

@export var character: TogglePlayer

func enter() -> void:
	print("running")
	pass


func update(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up") and character.is_on_floor():
		Transitioned.emit("JumpState")
	if character.velocity.y > 0:
		Transitioned.emit("FallState")


func physicsUpdate(delta: float) -> void:
	character.hearInputMoveDirection(delta)
