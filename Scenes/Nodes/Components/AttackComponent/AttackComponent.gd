extends Area2D
class_name AttackComponent

@export var damage: float = 1
@export var delay: float = 0.2
@export var duration: float = 0.1
@export var knockback: float = 0
@export var stunTime: float = 0

@onready var durationTimer: Timer = $DurationTimer
@onready var delayTimer: Timer = $DelayTimer

signal didAttack(body: Node2D, attack: Attack)


func _ready() -> void:
	flipMonitoring(false)
	
	delayTimer.wait_time = delay
	delayTimer.timeout.connect(attack)
	
	durationTimer.wait_time = duration
	durationTimer.timeout.connect(
		func():
			flipMonitoring(false)
	)


func startAttack() -> void:
	if delayTimer.is_stopped():
		delayTimer.start()


func attack() -> void:
	flipMonitoring(true)
	durationTimer.start()


func onBodyEntered(body: Node2D) -> void:
	didAttack.emit(body, createAttack())


func createAttack() -> Attack:
	var attack = Attack.new()
	attack.damage = damage
	attack.stunTime = stunTime
	attack.knockback = knockback
	attack.position = global_position
	
	return attack


func flipMonitoring(val: bool) -> void:
	monitoring = val
	monitorable = val
