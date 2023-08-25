extends State
class_name AttackState

@export var character: SelfMover
@export var attackComponent: AttackComponent

func _ready() -> void:
	attackComponent.didFinishAttack.connect(exitState)


func enter() -> void:
	attackComponent.startAttack(character.direction)


func exitState() -> void:
	var parent = get_parent()
	if parent is StateMachine:
		parent.transitionToDefault()
