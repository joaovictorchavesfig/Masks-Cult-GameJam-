## Cena principal do jogo - Gerencia a inicialização da UI
extends Node2D


@onready var idle_label: Label = $CanvasLayer/PanelContainer/IdleLabel


func _ready() -> void:
	_setup_game_manager()


func _setup_game_manager() -> void:
	GameManager.idle_label = idle_label
	GameManager.update_ui()
