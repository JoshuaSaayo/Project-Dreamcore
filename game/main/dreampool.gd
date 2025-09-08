extends Node3D

@export var player: Node3D
@export var chunk_a: Node3D
@export var chunk_b: Node3D
@export var chunk_length: float = 50.0  # length of corridor

func _process(_delta):
	if player.global_position.z < chunk_a.global_position.z - chunk_length/2:
		chunk_a.global_position.z = chunk_b.global_position.z - chunk_length
	elif player.global_position.z < chunk_b.global_position.z - chunk_length/2:
		chunk_b.global_position.z = chunk_a.global_position.z - chunk_length
