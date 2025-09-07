extends RigidBody3D

@onready var water_level: Marker3D = $"../../Terrain/WaterLevel"
@export var buoyancy_force: float = 15.0
@export var water_drag: float = 2.0

func _physics_process(delta):
	if water_level == null:
		return
	
	var obj_y = global_transform.origin.y
	var surface_y = water_level.global_transform.origin.y

	# If object is below the water surface → apply buoyancy
	if obj_y < surface_y:
		print("Applying buoyancy force!")
		var depth = surface_y - obj_y
		var force = Vector3.UP * buoyancy_force * depth
		apply_central_force(force)

		# Water drag slows movement inside water
		linear_velocity *= (1.0 - delta * water_drag)
