extends State
class_name ShootSate

@export var shotComponent: ShotComponent

func _ready() -> void:
	shotComponent.didShoot.connect(exitState)


func enter() -> void:
	shotComponent.shoot()


func exitState() -> void:
	var parent = get_parent()
	if parent is StateMachine:
		parent.transitionToDefault()
