extends State
class_name ChaseState

@export var enemy: Enemy
@export var tracker: TrackerComponent

func _ready() -> void:
	tracker.didFind.connect(enterAttackState)


func enterAttackState(_node: Node2D) -> void:
	transitionTo.emit($"../AttackState")


func enter() -> void:
	tracker.start() 


func update(_delta: float) -> void:
	var xDirection = enemy.player.global_position.x - enemy.global_position.x
	if xDirection > 0:
		enemy.direction.x = 1
	else:
		enemy.direction.x = -1
		
	tracker.collisionBox.position = tracker.offset * enemy.direction


func physicsUpdate(delta: float) -> void:
	enemy.accelerate(delta)


func exit() -> void:
	enemy.velocity = Vector2.ZERO
	tracker.stop()
