## Personagem líder controlado pelo jogador via clique do mouse
extends CharacterBody2D
class_name Leader


# ============================================================================
# CONFIGURAÇÕES EXPORTADAS
# ============================================================================
@export_group("Movimento")
@export var speed: float = 200.0
@export var stop_distance: float = 10.0

# ============================================================================
# REFERÊNCIAS DE NÓS
# ============================================================================
@onready var sprite: Sprite2D = $Sprite2D

# ============================================================================
# VARIÁVEIS PRIVADAS
# ============================================================================
var _target_position: Vector2


# ============================================================================
# FUNÇÕES BUILT-IN
# ============================================================================
func _ready() -> void:
	_target_position = global_position


func _unhandled_input(event: InputEvent) -> void:
	if _is_click_event(event):
		_target_position = get_global_mouse_position()


func _physics_process(_delta: float) -> void:
	_process_movement()


# ============================================================================
# FUNÇÕES PRIVADAS
# ============================================================================
func _is_click_event(event: InputEvent) -> bool:
	return (
		event is InputEventMouseButton 
		and event.button_index == MOUSE_BUTTON_LEFT 
		and event.pressed
	)


func _process_movement() -> void:
	var distance := global_position.distance_to(_target_position)
	
	if distance > stop_distance:
		var direction := global_position.direction_to(_target_position)
		velocity = direction * speed
		move_and_slide()
		_update_sprite_direction(direction)
	else:
		velocity = Vector2.ZERO


func _update_sprite_direction(direction: Vector2) -> void:
	if direction.x != 0:
		sprite.flip_h = direction.x < 0
