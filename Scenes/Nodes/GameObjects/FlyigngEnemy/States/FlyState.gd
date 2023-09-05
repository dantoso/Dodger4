extends State
class_name FlyState

@export var character: FlyingEnemy

func update(delta: float) -> void:
	if character.global_position.y > character.flyHeight:
		character.velocity.y = -300
