## Detecta hover do mouse para mostrar/esconder UI de interação
extends Area2D


# ============================================================================
# REFERÊNCIAS DE NÓS
# ============================================================================
@onready var ui_container: Control = $"../../CanvasLayer/PanelContainer/IdleLabel"


# ============================================================================
# CALLBACKS DE SINAIS
# ============================================================================
func _on_mouse_entered() -> void:
	_set_ui_visible(true)


func _on_mouse_exited() -> void:
	_set_ui_visible(false)


# ============================================================================
# FUNÇÕES PRIVADAS
# ============================================================================
func _set_ui_visible(visible: bool) -> void:
	if is_instance_valid(ui_container):
		ui_container.visible = visible
