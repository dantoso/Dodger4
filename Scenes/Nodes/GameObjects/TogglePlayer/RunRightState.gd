extends State
class_name RunRightState

@export var character: TogglePlayer

func enter() -> void:


func update(delta: float) -> void:
	if Input.is_action_just_pressed("ui_left"):
		Transitioned.emit("RunLeftState")
	else:
		character.velocity.x = character.maxSpeed


func physicsUpdate(delta: float) -> void:
	character.velocity = Vector2.ZERO
