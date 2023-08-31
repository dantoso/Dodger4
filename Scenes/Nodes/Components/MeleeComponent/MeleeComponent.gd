extends DamageDealer
class_name MeleeComponent

@export var shape: Shape2D

@onready var durationTimer: Timer = $DurationTimer
@onready var delayTimer: Timer = $DelayTimer
@onready var parent: Node2D = get_parent()

@onready var collisionChild: CollisionShape2D = $CollisionShape2D
var initialPosition: Vector2
var direction: Vector2


func _ready() -> void:
	initialPosition = collisionChild.position
	remove_child(collisionChild)
	
	delayTimer.wait_time = delay
	delayTimer.timeout.connect(_attack)
	
	durationTimer.wait_time = duration
	durationTimer.timeout.connect(_endAttack)
	
	if parent is SelfMover:
		parent.didChangeDirectionTo.connect(
			func(newValue: Vector2):
				direction = newValue
		)


func startAttack() -> void:
	if delayTimer.is_stopped():
		delayTimer.start()


func _attack() -> void:
	if direction != Vector2.ZERO:
		collisionChild.position.x = direction.x*initialPosition.x
		collisionChild.position.y = direction.y*initialPosition.x
	add_child(collisionChild)
	durationTimer.start()


func _endAttack() -> void:
	remove_child(collisionChild)
	didFinishAttack.emit()
