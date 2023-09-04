extends DamageDealer
class_name Shot

@export var speed: float = 250
var direction: = Vector2.ZERO

func _ready() -> void:
	_setupColliders()
	didHit.connect(unspawn)


func _physics_process(delta: float) -> void:
	position += direction * speed * delta


func spawn(shotDirection: Vector2) -> void:
	direction = shotDirection
	_spawnColliders(shotDirection)



func unspawn(_atk: Attack) -> void:
	queue_free()
