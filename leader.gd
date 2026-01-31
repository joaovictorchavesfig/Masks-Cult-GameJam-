extends CharacterBody2D
class_name Leader

# Configurações
@export var speed: float = 200.0
@export var stop_distance: float = 10.0

# Variável para armazenar onde clicamos
var target_position: Vector2

func _ready():
	# Inicializa o alvo na posição atual para ele não sair correndo no começo
	target_position = global_position

func _unhandled_input(event):
	# Detecta o clique esquerdo do mouse
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# Atualiza o alvo para a posição global do mouse
			target_position = get_global_mouse_position()

func _physics_process(_delta):
	# Verifica a distância até o alvo
	if global_position.distance_to(target_position) > stop_distance:
		# Define a direção
		var direction = global_position.direction_to(target_position)
		
		# Define a velocidade (Direção * Velocidade)
		velocity = direction * speed
		
		# Aplica o movimento
		move_and_slide()
		
		# Opcional: Virar o sprite para o lado que está andando
		if direction.x < 0:
			$Sprite2D.flip_h = true # Esquerda
		elif direction.x > 0:
			$Sprite2D.flip_h = false # Direita
	else:
		# Para o personagem se estiver muito perto
		velocity = Vector2.ZERO
