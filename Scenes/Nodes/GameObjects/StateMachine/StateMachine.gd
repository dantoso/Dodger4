extends Node
class_name StateMachine

@export var currentState: State

func _ready() -> void:
	currentState.transitionTo.connect(transitionTo)
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


func transitionTo(newState: State):
	if currentState == newState:
		return
	
	if !currentState:
		return
	
	if !newState:
		return
	
	currentState.transitionTo.disconnect(transitionTo)
	currentState.exit()
	
	newState.transitionTo.connect(transitionTo)
	newState.enter()
	currentState = newState
