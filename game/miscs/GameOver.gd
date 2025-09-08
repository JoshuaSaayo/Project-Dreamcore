extends CanvasLayer


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main/dreampool.tscn")

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):  # Enter/Space by default
		_on_button_pressed()
