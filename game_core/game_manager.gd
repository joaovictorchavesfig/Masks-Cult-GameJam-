## Gerenciador global do jogo - Controla recursos e estado do jogo
## Autoload: acessível globalmente como GameManager
extends Node


# ============================================================================
# CONSTANTES
# ============================================================================
const UI_TEXT_FORMAT: String = "PESSOAS OCIOSAS: %d"

# ============================================================================
# VARIÁVEIS DE ESTADO
# ============================================================================
var idle_people: int = 0:
	set(value):
		idle_people = maxi(0, value)
		update_ui()

var idle_label: Label = null


# ============================================================================
# FUNÇÕES PÚBLICAS
# ============================================================================
func add_idle_people(amount: int = 1) -> void:
	idle_people += amount


func remove_idle_people(amount: int = 1) -> bool:
	if idle_people >= amount:
		idle_people -= amount
		return true
	return false


func update_ui() -> void:
	if is_instance_valid(idle_label):
		idle_label.text = UI_TEXT_FORMAT % idle_people
