extends Area2D
class_name TrackerComponent

var foundBody: Node2D
var lastLocation: Vector2

signal didFind(body: Node2D)
signal didLose(body: Node2D)

func _init() -> void:
	body_entered.connect(_onBodyEnter)
	body_exited.connect(_onBodyExit)


func _onBodyEnter(body: Node2D) -> void:
	lastLocation = body.global_position
	foundBody = body
	didFind.emit(body)


func _onBodyExit(body: Node2D) -> void:
	lastLocation = body.global_position
	foundBody = null
	didLose.emit(body)


func _process(delta: float) -> void:
	if foundBody:
		lastLocation = foundBody.global_position
