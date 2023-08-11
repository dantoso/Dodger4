extends State
class_name JumpState

@export var character: TogglePlayer

func enter() -> void:
	print("jumping")
	character.velocity.y = character.jumpSpeed


func update(delta: float) -> void:
	if character.velocity.y >= 0:
		transitionTo.emit($"../FallState")


func handleInput(event: InputEvent) -> void:
	if event.is_action_released("ui_up"):
		character.velocity.y = 0
