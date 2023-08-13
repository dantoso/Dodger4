extends Area2D
class_name AttackComponent

@export var damage: float = 1
@export var delay: float = 0.2
@export var duration: float = 0.1
@export var knockback: float = 0
@export var stunTime: float = 0

@onready var durationTimer: Timer = $DurationTimer
@onready var delayTimer: Timer = $DelayTimer

signal didAttack(attack: Attack)


func _ready() -> void:
	_flipMonitoring(false)
	
	delayTimer.wait_time = delay
	delayTimer.timeout.connect(_attack)
	
	durationTimer.wait_time = duration
	durationTimer.timeout.connect(
		func():
			_flipMonitoring(false)
	)


func startAttack() -> void:
	if delayTimer.is_stopped():
		delayTimer.start()


func _attack() -> void:
	_flipMonitoring(true)
	durationTimer.start()


func _onAreaEntered(node: HealthComponent) -> void:
	if node == null:
		print("ERROR: attack component receiving non health component contact")
		return
	
	var attack: Attack = _createAttack()
	node.takeAttack(attack)
	didAttack.emit(attack)


func _createAttack() -> Attack:
	var attack = Attack.new()
	attack.damage = damage
	attack.stunTime = stunTime
	attack.knockback = knockback
	attack.position = global_position
	
	return attack


func _flipMonitoring(val: bool) -> void:
	monitoring = val
	monitorable = val
