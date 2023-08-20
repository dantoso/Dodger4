extends Area2D
class_name TrackerComponent

@export var shape: Shape2D
@export var offset: Vector2 = Vector2.ZERO

var foundBody: Node2D
var lastLocation: Vector2
var collisionBox: CollisionShape2D

signal didFind(body: Node2D)
signal didLose(body: Node2D)

func _ready() -> void:
	body_entered.connect(_onBodyEnter)
	body_exited.connect(_onBodyExit)
	collisionBox = _createCollision()


func start() -> void:
	collisionBox.position += offset
	add_child(collisionBox)


func stop() -> void:
	remove_child(collisionBox)


func _onBodyEnter(body: Node2D) -> void:
	lastLocation = body.global_position
	foundBody = body
	didFind.emit(body)


func _onBodyExit(body: Node2D) -> void:
	lastLocation = body.global_position
	foundBody = null
	didLose.emit(body)


func _process(_delta: float) -> void:
	if foundBody:
		lastLocation = foundBody.global_position


func _createCollision() -> CollisionShape2D:
	var collision = CollisionShape2D.new()
	collision.shape = shape
	
	return collision
