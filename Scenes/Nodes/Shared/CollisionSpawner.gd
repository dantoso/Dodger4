extends Area2D
class_name CollisionSpawner

var colliders: Array[ColliderData] = []

func _setupColliders() -> void:
	var children = get_children()
	for child in children:
		if child is CollisionShape2D:
			var collider: = ColliderData.new(child, child.position)
			colliders.append(collider)
			remove_child(child)


func _spawnColliders(direction: Vector2) -> void:
	for collider in colliders:
		_setColliderPosition(collider, direction)
		add_child(collider.box)


func _setCollidersPositions(direction: Vector2) -> void:
	for collider in colliders:
		_setColliderPosition(collider, direction)


func _unspawnColliders() -> void:
	for collider in colliders:
		remove_child(collider.box)


func _setColliderPosition(collider: ColliderData, direction: Vector2) -> void:
	var box = collider.box
	
	var xx: = direction.x*collider.initialPosition.x
	var yy: = direction.y*collider.initialPosition.y
	box.position.x = xx + yy
	
	var yx: = direction.y*collider.initialPosition.x
	var xy: = direction.x*collider.initialPosition.y
	box.position.y = xy + yx
