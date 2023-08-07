extends CharacterBody2D
class_name TogglePlayer

const maxSpeed: = Vector2(300, 1000)
const acceleration: = 30.0
const jumpSpeed: = -400.0

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: = 1

func _physics_process(delta: float) -> void:
	velocity.y = min(
		velocity.y + gravity*delta,
		maxSpeed.y
	)
	move_and_slide()

func hearInputMoveDirection() -> void:
	if Input.is_action_just_pressed("ui_left"):
		direction = -1
	elif Input.is_action_just_pressed("ui_right"):
		direction = 1
	
	var newVelocity = velocity.x + acceleration*direction
	
	if newVelocity > maxSpeed.x || newVelocity < -maxSpeed.x:
		velocity.x = maxSpeed.x*direction
	else:
		velocity.x = newVelocity
