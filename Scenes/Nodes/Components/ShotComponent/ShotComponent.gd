extends DamageDealer
class_name ShotComponent

@export var distance: float = 10

@onready var delayTimer: Timer = $DelayTimer

func _ready() -> void:
	delayTimer.wait_time = delay
	delayTimer.timeout.connect(_attack)

func _attack() -> void:
	
