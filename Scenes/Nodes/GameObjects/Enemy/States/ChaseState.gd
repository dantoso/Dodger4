extends State
class_name ChaseState

@export var enemy: Enemy

func enter() -> void:
	print("chasing")


func update(_delta: float) -> void:
	var xDirection = enemy.player.global_position.x - enemy.global_position.x
	if xDirection > 0:
		enemy.direction.x = 1
	else:
		enemy.direction.x = -1


func physicsUpdate(delta: float) -> void:
	enemy.accelerate(delta)
