extends DamageDealer
class_name MeleeComponent

@export var delay: float = 0.2
@export var duration: float = 0.1

@onready var durationTimer: Timer = $DurationTimer
@onready var delayTimer: Timer = $DelayTimer
@onready var parent: Node2D = get_parent()

var characterDirection: Vector2
var atkDirection: Vector2 = Vector2(1,0)

func _ready() -> void:
	_setupColliders()
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
	_spawnColliders(atkDirection)
	durationTimer.start()


func _endAttack() -> void:
	_unspawnColliders()
	didFinishAttack.emit()
