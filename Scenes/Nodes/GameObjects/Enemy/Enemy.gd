extends Gravitable
class_name Enemy

const maxSpeed: = 200.0
const acceleration: = 600.0
const jumpSpeed: = -500.0

var direction: = 1

@onready var health: HealthComponent = $HealthComponent

func _ready() -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_GROUNDED
	health.didTakeDamage.connect(tookDamage)

func _physics_process(delta: float) -> void:
	applyGravity(delta)
	move_and_slide()


func tookDamage(attack: Attack) -> void:
	if health.currentHP <= 0:
		queue_free()
