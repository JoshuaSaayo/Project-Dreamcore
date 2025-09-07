extends Area3D

@export var flow_strength: float = 5.0          # push strength
@export var oscillation_speed: float = 0.5      # current wave speed
@export var wobble_amount: float = 5.0          # tilt amount (degrees)
@export var wobble_speed: float = 1.0           # tilt speed
@export var bob_height: float = 0.2             # bob amplitude
@export var bob_speed: float = 1.2              # bobbing speed
@export var buoyancy_strength: float = 10.0     # upward force

func _physics_process(delta):
	var t = Time.get_ticks_msec() / 1000.0

	# Smooth oscillation force (pool current)
	var flow_x = sin(t * oscillation_speed) * flow_strength
	var flow_z = cos(t * oscillation_speed * 0.7) * flow_strength
	var flow_force = Vector3(flow_x, 0, flow_z)

	# Bobbing wave offset
	var bob = sin(t * bob_speed) * bob_height

	for body in get_overlapping_bodies():
		if body is RigidBody3D:
			# --- Apply horizontal drift ---
			body.apply_central_force(flow_force)

			# --- Apply upward buoyancy (with bobbing) ---
			var buoyancy = Vector3(0, buoyancy_strength + bob, 0)
			body.apply_central_force(buoyancy)

			# --- Gentle wobble (rotation torque instead of direct set) ---
			var wobble_x = sin(t * wobble_speed) * wobble_amount
			var wobble_z = cos(t * wobble_speed * 0.8) * wobble_amount
			var torque = Vector3(wobble_x, 0, wobble_z) * 0.01
			body.apply_torque(torque)
