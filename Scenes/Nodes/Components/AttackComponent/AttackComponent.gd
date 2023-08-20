extends Area2D
class_name AttackComponent

@export var damage: float = 1
@export var delay: float = 0.2
@export var duration: float = 0.1
@export var knockback: float = 0
@export var stunTime: float = 0

@export var shape: Shape2D
@export var xOffset: Vector2 = Vector2.ZERO

@onready var durationTimer: Timer = $DurationTimer
@onready var delayTimer: Timer = $DelayTimer

signal didHit(attack: Attack)
signal didFinishAttack()

var collisionChild: CollisionShape2D
var direction: Vector2


func _init() -> void:
	area_entered.connect(_onAreaEntered)


func _ready() -> void:
	delayTimer.wait_time = delay
	delayTimer.timeout.connect(_attack)
	
	durationTimer.wait_time = duration
	durationTimer.timeout.connect(_endAttack)
	
	collisionChild = _createCollision()


func startAttack(atkDirection: Vector2) -> void:
	if delayTimer.is_stopped() and atkDirection:
		direction = atkDirection
		delayTimer.start()


func _attack() -> void:
	collisionChild.position = xOffset*direction
	add_child(collisionChild)
	durationTimer.start()


func _endAttack() -> void:
	remove_child(collisionChild)
	didFinishAttack.emit()


func _onAreaEntered(node: HealthComponent) -> void:
	if node == null:
		print("ERROR: attack component receiving non health component contact")
		return
	
	var attack: Attack = _createAttack()
	node.takeAttack(attack)
	didHit.emit(attack)


func _createAttack() -> Attack:
	var attack = Attack.new()
	attack.damage = damage
	attack.stunTime = stunTime
	attack.knockback = knockback
	attack.position = global_position
	
	return attack


func _createCollision() -> CollisionShape2D:
	var collision: = CollisionShape2D.new()
	collision.shape = shape
	
	return collision
