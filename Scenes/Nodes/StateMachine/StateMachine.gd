extends Node
class_name StateMachine

@export var currentState: State
var states: Dictionary = {}

func _ready() -> void:
	currentState.Transitioned.connect(onStateTransition)
	currentState.enter()
	
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child


func _process(delta: float) -> void:
	if currentState:
		currentState.update(delta)


func _physics_process(delta: float) -> void:
	if currentState:
		currentState.physicsUpdate(delta)


func onStateTransition(newStateName: String):
	if !currentState:
		return
	
	var newState = states.get(newStateName.to_lower())
	
	if !newState:
		return
	
	currentState.Transitioned.disconnect(onStateTransition)
	currentState.exit()
	
	newState.Transitioned.connect(onStateTransition)
	newState.enter()
	currentState = newState
