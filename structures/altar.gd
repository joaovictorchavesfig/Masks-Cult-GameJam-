extends Area2D
class_name Altar

var peopleInAltar: int = 0
var leaderInAltar: int = 0
@onready var label: Label = $"../PeopleNumber/Label" # Verifique se esse caminho está certo na sua cena!

func _ready() -> void:
	# É melhor usar _ready do que _init para manipular UI
	label.text = str(peopleInAltar + leaderInAltar)

func _on_body_entered(body: Node2D) -> void:
	# 1. VERIFICAÇÃO DE SEGURANÇA: É o líder?
	if body is Leader:
		leaderInAltar += 1
		update_label()
		return # PARE O CÓDIGO AQUI. Não deixe ele descer para o queue_free()
	
	# 2. Se o código chegou aqui, significa que NÃO é o líder.
	# Então é um civil/seguidor.
	body.queue_free() # Deleta o boneco da tela
	peopleInAltar += 1
	update_label()

func _on_body_exited(body: Node2D) -> void:
	# É importante detectar quando o líder sai andando
	if body is Leader:
		leaderInAltar -= 1
		update_label()

# --- BOTÕES ---

func _on_plus_button_pressed() -> void:
	if GameManager.idle_people > 0:
		GameManager.remove_idle_people()
		peopleInAltar += 1
		update_label()

func _on_minus_button_pressed() -> void:
	if peopleInAltar > 0:
		GameManager.add_idle_people()
		peopleInAltar -= 1
		update_label()

# Função auxiliar para não repetir código
func update_label() -> void:
	label.text = str(peopleInAltar + leaderInAltar)
