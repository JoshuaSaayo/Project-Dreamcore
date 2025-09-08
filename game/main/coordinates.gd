extends Label

@export var player: Node3D

func _process(delta):
	if player:
		var pos = player.global_transform.origin
		text = "Player Position: X=%.2f, Y=%.2f, Z=%.2f" % [pos.x, pos.y, pos.z]
