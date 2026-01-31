## Altar - Estrutura onde pessoas podem ser alocadas para trabalhar
## Detecta entrada/saída do líder e gerencia trabalhadores
extends Area2D
class_name Altar


# ============================================================================
# REFERÊNCIAS DE NÓS
# ============================================================================
@onready var label: Label = $"../PeopleNumber/Label"

# ============================================================================
# VARIÁVEIS DE ESTADO
# ============================================================================
var _people_count: int = 0
var _leader_present: bool = false

## Retorna o total de pessoas no altar (incluindo líder se presente)
var total_count: int:
	get: return _people_count + (1 if _leader_present else 0)

# ============================================================================
# FUNÇÕES BUILT-IN
# ============================================================================
func _ready() -> void:
	_update_label()


# ============================================================================
# CALLBACKS DE SINAIS
# ============================================================================
func _on_body_entered(body: Node2D) -> void:
	if body is Leader:
		_handle_leader_entered()
	else:
		_handle_follower_entered(body)


func _on_body_exited(body: Node2D) -> void:
	if body is Leader:
		_handle_leader_exited()


func _on_plus_button_pressed() -> void:
	_add_person_from_idle()


func _on_minus_button_pressed() -> void:
	_remove_person_to_idle()


# ============================================================================
# FUNÇÕES PRIVADAS
# ============================================================================
func _handle_leader_entered() -> void:
	_leader_present = true
	_update_label()


func _handle_leader_exited() -> void:
	_leader_present = false
	_update_label()


func _handle_follower_entered(follower: Node2D) -> void:
	follower.queue_free()
	_people_count += 1
	_update_label()


func _add_person_from_idle() -> void:
	if GameManager.remove_idle_people():
		_people_count += 1
		_update_label()


func _remove_person_to_idle() -> void:
	if _people_count > 0:
		_people_count -= 1
		GameManager.add_idle_people()
		_update_label()


func _update_label() -> void:
	if is_instance_valid(label):
		label.text = str(total_count)
