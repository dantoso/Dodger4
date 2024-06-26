extends State
class_name JumpState

@export var character: TogglePlayer

func enter() -> void:
	print("jumping")
	character.velocity.y = character.jumpSpeed


func update(_delta: float) -> void:
	if character.velocity.y >= 0:
		transitionTo.emit($"../FallState")


func physicsUpdate(delta: float) -> void:
	character.accelerate(delta)


func handleInput(event: InputEvent) -> void:
	if event.is_action_released("up"):
		character.velocity.y = 0
