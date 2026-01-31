extends Area2D

@onready var container: Node = $"../Container"

func _on_mouse_entered() -> void:
	container.show()

func _on_mouse_exited() -> void:
	container.hide()
