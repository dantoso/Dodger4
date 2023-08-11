extends Node
class_name StateMachine

@export var currentState: State

func _ready() -> void:
	currentState.transitionTo.connect(onStateTransition)
	currentState.enter()


func _process(delta: float) -> void:
	if currentState:
		currentState.update(delta)


func _physics_process(delta: float) -> void:
	if currentState:
		currentState.physicsUpdate(delta)


func _unhandled_input(event: InputEvent) -> void:
	if currentState:
		currentState.handleInput(event)


func onStateTransition(newState: State):
	if !currentState:
		return
	
	if !newState:
		return
	
	currentState.transitionTo.disconnect(onStateTransition)
	currentState.exit()
	
	newState.transitionTo.connect(onStateTransition)
	newState.enter()
	currentState = newState
