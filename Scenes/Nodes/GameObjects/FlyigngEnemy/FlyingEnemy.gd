extends SelfMover
class_name FlyingEnemy

@export var flyHeight: float = 10

func _physics_process(delta: float) -> void:
	applyGravity(delta)
	move_and_slide()
