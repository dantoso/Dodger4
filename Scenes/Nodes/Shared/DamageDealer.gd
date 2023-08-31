extends Area2D
class_name DamageDealer

@export var damage: float = 1
@export var delay: float = 0.2
@export var duration: float = 0.1
@export var knockback: float = 0
@export var stunTime: float = 0

signal didHit(attack: Attack)
signal didFinishAttack()

func _init() -> void:
	area_entered.connect(_onAreaEntered)


func _onAreaEntered(node: HealthComponent) -> void:
	if node == null:
		print("ERROR: damage dealer receiving non health component contact")
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
