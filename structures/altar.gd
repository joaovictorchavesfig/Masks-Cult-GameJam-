extends Area2D
class_name Altar

var hasLeader: bool = false
var peopleInAltar: int = 0
@onready var label: Label = $"../PeopleNumber/Label"

func _init() -> void:
	print(peopleInAltar)

func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	if body is Leader:
		hasLeader = true
	
	peopleInAltar += 1
	label.text = str(peopleInAltar)


func _on_plus_button_pressed() -> void:
	if GameManager.idle_people > 0:
		GameManager.remove_idle_people()
		peopleInAltar += 1
		label.text = str(peopleInAltar)

func _on_minus_button_pressed() -> void:
	if peopleInAltar > 0:
		GameManager.add_idle_people()
		peopleInAltar -= 1
		label.text = str(peopleInAltar)
