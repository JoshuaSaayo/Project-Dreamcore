extends RigidBody3D

@export var buoyancy: float = 9.8
@export var flow_force: Vector3 = Vector3(0, 0, -1)

func _physics_process(delta):
	# Buoyancy force (keep object near surface, y = 0)
	if global_transform.origin.y < 0.0:
		apply_central_force(Vector3(0, buoyancy, 0))
	
	# Flow force (pushes object along Z axis)
	apply_central_force(flow_force)
