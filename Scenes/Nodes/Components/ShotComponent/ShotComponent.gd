extends Node2D
class_name ShotComponent

@export var delay: float = 0.2

@onready var delayTimer: Timer = $DelayTimer
@onready var shot: Shot = $Shot
var direction: = Vector2(1,0)

signal didShoot()

func _ready() -> void:
	remove_child(shot)
	delayTimer.wait_time = delay
	delayTimer.timeout.connect(_spawnShot)
	
	var parent = get_parent()
	if parent.has_signal("didChangeDirectionTo"):
		parent.didChangeDirectionTo.connect(
			func(newValue: Vector2):
				direction = newValue
		)
	


func shoot() -> void:
	if delayTimer.is_stopped():
		delayTimer.start()


func _spawnShot() -> void:
	var world = get_tree().root.get_child(0)
	world.add_child(shot)
	shot.spawn(direction)
	didShoot.emit()
