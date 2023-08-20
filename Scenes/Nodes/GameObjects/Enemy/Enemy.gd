extends SelfMover
class_name Enemy

@export var player: TogglePlayer

@onready var health: HealthComponent = $HealthComponent

func _ready() -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_GROUNDED
	
	var attackState: AttackState = $StateMachine/AttackState
	attackState.exitingAttackState.connect(
		func ():
			attackState.transitionTo.emit($StateMachine/ChaseState)
	)
	
	health.didTakeDamage.connect(tookDamage)


func _physics_process(delta: float) -> void:
	applyGravity(delta)
	move_and_slide()


func tookDamage(_attack: Attack) -> void:
	if health.currentHP <= 0:
		queue_free()
