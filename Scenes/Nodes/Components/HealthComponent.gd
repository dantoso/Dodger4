extends Area2D
class_name HealthComponent

@export var maxHP: float = 3
@onready var node: Node2D = get_parent()

var currentHP: float

signal didTakeDamage(health: HealthComponent, attack: Attack)
signal didReceiveHeal(health: HealthComponent, heal: float)

func _ready() -> void:
	currentHP = maxHP


func takeDamage(attack: Attack) -> void:
	currentHP -= attack.damage
	didTakeDamage.emit(self, attack)


func receiveHeal(heal: float) -> void:
	currentHP = min(maxHP, currentHP+heal)
	didReceiveHeal.emit(self, heal)
