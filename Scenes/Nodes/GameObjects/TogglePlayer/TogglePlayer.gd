extends Gravitable
class_name TogglePlayer

const maxSpeed: = 200.0
const acceleration: = 600.0
const jumpSpeed: = -500.0

var direction: = 1

func _ready() -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_GROUNDED


func _physics_process(delta: float) -> void:
	applyGravity(delta)
	calculateXVelocity(delta)
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_left"):
		direction = -1
	elif event.is_action_pressed("ui_right"):
		direction = 1


func calculateXVelocity(delta: float) -> void: 
	var newVelocity = velocity.x + acceleration*direction*delta
	
	if newVelocity > maxSpeed || newVelocity < -maxSpeed:
		velocity.x = maxSpeed*direction
	else:
		velocity.x = newVelocity
