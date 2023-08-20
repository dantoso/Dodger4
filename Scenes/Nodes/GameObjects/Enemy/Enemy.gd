extends SelfMover
class_name Enemy

@onready var health: HealthComponent = $HealthComponent
@export var player: TogglePlayer

func _ready() -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_GROUNDED
	health.didTakeDamage.connect(tookDamage)


func _physics_process(delta: float) -> void:
	applyGravity(delta)
	move_and_slide()


func tookDamage(_attack: Attack) -> void:
	if health.currentHP <= 0:
		queue_free()
