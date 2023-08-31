extends State
class_name FallState

@export var character: SelfMover

func enter() -> void:
	print("falling")


func update(_delta: float) -> void:
	if character.velocity.y == 0:
		transitionTo.emit($"../RunState")


func physicsUpdate(delta: float) -> void:
	character.accelerate(delta)
