extends Gravitable
class_name SelfMover

@export var maxSpeed: = 200.0
@export var acceleration: = 800.0
@export var jumpSpeed: = -600.0

var direction: Vector2 = Vector2(1, 1)

func accelerate(delta: float) -> void: 
	var newVelocity = velocity.x + acceleration*direction.x*delta
	
	if newVelocity > maxSpeed || newVelocity < -maxSpeed:
		velocity.x = maxSpeed*direction.x
	else:
		velocity.x = newVelocity
