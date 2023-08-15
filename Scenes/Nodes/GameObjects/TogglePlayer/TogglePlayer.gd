extends Gravitable
class_name TogglePlayer

const maxSpeed: = 200.0
const acceleration: = 800.0
const jumpSpeed: = -600.0

var direction: Vector2 = Vector2(1, 1)

@onready var attackComponent: AttackComponent = $AttackComponent

func _ready() -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_GROUNDED


func _physics_process(delta: float) -> void:
	applyGravity(delta)
	calculateXVelocity(delta)
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left"):
		direction.x = -1
	elif event.is_action_pressed("right"):
		direction.x = 1
	elif event.is_action_pressed("attack"):
		attackComponent.startAttack(direction)


func calculateXVelocity(delta: float) -> void: 
	var newVelocity = velocity.x + acceleration*direction.x*delta
	
	if newVelocity > maxSpeed || newVelocity < -maxSpeed:
		velocity.x = maxSpeed*direction.x
	else:
		velocity.x = newVelocity

