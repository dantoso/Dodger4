extends Area2D
class_name HealthComponent

@export var maxHP: float = 3
@onready var node: Node2D = get_parent()

var currentHP: float

signal didTakeDamage(attack: Attack)
signal didReceiveHeal(heal: float)

func _ready() -> void:
	currentHP = maxHP


func takeAttack(attack: Attack) -> void:
	currentHP -= attack.damage
	didTakeDamage.emit(attack)


func receiveHeal(heal: float) -> void:
	currentHP = min(maxHP, currentHP+heal)
	didReceiveHeal.emit(heal)
