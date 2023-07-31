extends Node
class_name StateMachine

@export var currentState: State
var states: Dictionary = {}

func _ready() -> void:
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
	print("transitioning")
	if !currentState:
		return
	
	var newState = states.get(newStateName.to_lower())
	
	if !newState:
		return
	
	currentState.Transitioned.disconnect(onStateTransition)
	currentState.exit()
	
	currentState.Transitioned.connect(onStateTransition)
	newState.enter()
	currentState = newState
