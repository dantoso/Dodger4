extends State
class_name AttackState

@export var character: SelfMover
@export var attackComponent: AttackComponent

signal exitingAttackState()


func enter() -> void:
	attackComponent.startAttack(character.direction)
	attackComponent.didFinishAttack.connect(exitState)


func exitState() -> void:
	exitingAttackState.emit()
