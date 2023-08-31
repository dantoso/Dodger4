class_name ColliderData

var box: CollisionShape2D
var initialPosition: Vector2

func _init(collision: CollisionShape2D, position: Vector2) -> void:
	self.box = collision
	self.initialPosition = position
