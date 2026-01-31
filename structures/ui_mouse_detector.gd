extends Area2D

@onready var area_2d: Altar = $"../Area2D"
@onready var container: Node = $"../Container"
@onready var remove_leader_button: Button = $"../RemoveLeaderButton"

func _on_mouse_entered() -> void:
	container.show()

func _on_mouse_exited() -> void:
	container.hide()
