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
	
	var clone = shot.duplicate()
	var shotCollider: = shot.colliders[0]
	var collider: = ColliderData.new(shotCollider.box.duplicate(), shotCollider.initialPosition)
	clone.colliders.clear()
	clone.colliders.append(collider)
	
	clone.global_position = global_position
	world.add_child(clone)
	clone.spawn(direction)
	
	didShoot.emit()
