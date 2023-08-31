extends Gravitable
class_name SelfMover

@export var maxSpeed: = 200.0
@export var acceleration: = 800.0
@export var jumpSpeed: = -600.0

@export var direction: Vector2 = Vector2(1, 0) : set = setDirection
signal didChangeDirectionTo(Vector2)


func setDirection(newValue: Vector2) -> void:
	direction = newValue
	didChangeDirectionTo.emit(newValue)

func accelerate(delta: float) -> void: 
	var newVelocity = velocity.x + acceleration*direction.x*delta
	
	if newVelocity > maxSpeed || newVelocity < -maxSpeed:
		velocity.x = maxSpeed*direction.x
	else:
		velocity.x = newVelocity


func deaccelerate(delta: float) -> void:
	var newVelocity = velocity.x - acceleration*direction.x*delta
	
	if direction.x == 1 and newVelocity > 0 || direction.x == -1 and newVelocity < 0:
		velocity.x = newVelocity
	else:
		velocity.x = 0
