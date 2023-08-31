extends State
class_name AttackState

@export var character: SelfMover
@export var meleeComponent: MeleeComponent

func _ready() -> void:
	meleeComponent.didFinishAttack.connect(exitState)


func enter() -> void:
	character.velocity.x = 0
	meleeComponent.startAttack()


func exitState() -> void:
	var parent = get_parent()
	if parent is StateMachine:
		parent.transitionToDefault()
