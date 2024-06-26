extends SelfMover
class_name TogglePlayer

@onready var stateMachine: StateMachine = $StateMachine

var stateBeforeAtk: State

func _ready() -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_GROUNDED


func _physics_process(delta: float) -> void:
	applyGravity(delta)
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left"):
		direction.x = -1
	elif event.is_action_pressed("right"):
		direction.x = 1
	elif event.is_action_pressed("attack"):
#		stateMachine.transitionTo($StateMachine/AttackState)
		stateMachine.transitionTo($StateMachine/ShootSate)
