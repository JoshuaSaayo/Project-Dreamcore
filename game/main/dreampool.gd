extends Node3D

@export var player: Node3D
@export var chunk_a: Node3D
@export var chunk_b: Node3D
@export var chunk_length: float = 50.0  # length of one hallway chunk

func _process(delta):
	if player.global_transform.origin.z < chunk_a.global_transform.origin.z - chunk_length:
		chunk_a.translate(Vector3(0, 0, -chunk_length * 2))
	if player.global_transform.origin.z < chunk_b.global_transform.origin.z - chunk_length:
		chunk_b.translate(Vector3(0, 0, -chunk_length * 2))
