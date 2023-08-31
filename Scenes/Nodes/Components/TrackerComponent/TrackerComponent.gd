extends CollisionSpawner
class_name TrackerComponent

var foundBody: Node2D
var lastLocation: Vector2

var direction: = Vector2(1,0)

signal didFind(body: Node2D)
signal didLose(body: Node2D)

func _ready() -> void:
	_setupColliders()
	body_entered.connect(_onBodyEnter)
	body_exited.connect(_onBodyExit)
	
	var parent = get_parent()
	if parent.has_signal("didChangeDirectionTo"):
		parent.didChangeDirectionTo.connect(
			func(newValue: Vector2):
				direction = newValue
				_setCollidersPositions(newValue)
		)


func start() -> void:
	_spawnColliders(direction)


func stop() -> void:
	_unspawnColliders()


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
