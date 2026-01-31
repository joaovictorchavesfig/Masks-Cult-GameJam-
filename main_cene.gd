extends Node2D

func _ready() -> void:
	GameManager.idle_label = $CanvasLayer/PanelContainer/IdleLabel
	GameManager.update_ui()
