extends Node
class_name StateMachine

var currentState: State
@export var defaultFloorState: State
@export var defaultAirState: State

func _ready() -> void:
	currentState = defaultAirState
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


func transitionToDefault() -> void:
	var parent = get_parent()
	if parent is SelfMover:
		if parent.is_on_floor():
			transitionTo(defaultFloorState)
		else:
			transitionTo(defaultAirState)


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
