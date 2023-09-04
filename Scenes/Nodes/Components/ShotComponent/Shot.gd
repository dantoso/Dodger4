extends DamageDealer
class_name Shot

@export var speed: float = 10
var direction: = Vector2.ZERO

func _ready() -> void:
	_setupColliders()


func _physics_process(delta: float) -> void:
	position += direction * speed * delta


func spawn(shotDirection: Vector2) -> void:
	direction = shotDirection
	_spawnColliders(shotDirection)
