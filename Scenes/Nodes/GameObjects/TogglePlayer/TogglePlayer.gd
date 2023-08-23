extends SelfMover
class_name TogglePlayer

@onready var attackComponent: AttackComponent = $AttackComponent
@onready var stateMachine: StateMachine = $StateMachine

var stateBeforeAtk: State

func _ready() -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_GROUNDED
	var attackState = $StateMachine/AttackState
	attackState.exitingAttackState.connect(didEndAttack)


func _physics_process(delta: float) -> void:
	applyGravity(delta)
	accelerate(delta)
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left"):
		direction.x = -1
	elif event.is_action_pressed("right"):
		direction.x = 1
	elif event.is_action_pressed("attack"):
		stateBeforeAtk = stateMachine.currentState
		stateMachine.transitionTo($StateMachine/AttackState)


func didEndAttack() -> void: 
	if stateBeforeAtk:
		stateMachine.transitionTo(stateBeforeAtk)
