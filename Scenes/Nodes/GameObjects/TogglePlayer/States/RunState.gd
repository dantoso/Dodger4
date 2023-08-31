extends State
class_name RunState

@export var character: TogglePlayer

func enter() -> void:
	print("running")
	pass


func update(_delta: float) -> void:
	if character.velocity.y > 0:
		transitionTo.emit($"../FallState")


func physicsUpdate(delta: float) -> void:
	character.accelerate(delta)


func handleInput(event: InputEvent) -> void:
	if event.is_action_pressed("up"):
		transitionTo.emit($"../JumpState")
