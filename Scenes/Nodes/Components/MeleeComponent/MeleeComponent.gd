extends DamageDealer
class_name MeleeComponent

@export var shape: Shape2D

@onready var durationTimer: Timer = $DurationTimer
@onready var delayTimer: Timer = $DelayTimer
@onready var parent: Node2D = get_parent()

@onready var collisionChild: CollisionShape2D = $CollisionShape2D
var initialPosition: Vector2
var characterDirection: Vector2
var atkDirection: Vector2


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
				characterDirection = newValue
		)


func startAttack() -> void:
	if delayTimer.is_stopped():
		if characterDirection != Vector2.ZERO:
			atkDirection = characterDirection
		delayTimer.start()


func _attack() -> void:
	collisionChild.position.x = atkDirection.x*initialPosition.x
	collisionChild.position.y = atkDirection.y*initialPosition.x
	add_child(collisionChild)
	durationTimer.start()


func _endAttack() -> void:
	remove_child(collisionChild)
	didFinishAttack.emit()
