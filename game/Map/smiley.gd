extends RigidBody3D

@export var float_force = 1.0

@onready var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

const water_height = 0.0

func _physics_process(delta: float) -> void:
	var depth = water_height - global_position.y
	if depth > 0:
		apply_central_force(Vector3.UP * float_force * gravity * depth)
		
