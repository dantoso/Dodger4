extends Area2D
class_name TrackerComponent

var foundBody: Node2D
var lastLocation: Vector2

func _init() -> void:
	body_entered.connect(_onBodyEnter)
	body_exited.connect(_onBodyExit)


func _onBodyEnter(body: Node2D) -> void:
	lastLocation = body.global_position
	foundBody = body


func _onBodyExit(body: Node2D) -> void:
	lastLocation = body.global_position
	foundBody = null


func _process(delta: float) -> void:
	if foundBody:
		lastLocation = foundBody.global_position
