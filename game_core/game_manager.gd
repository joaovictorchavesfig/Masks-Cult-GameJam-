extends Node

var idle_people: int = 0
var idle_label: Label 

func add_idle_people() -> void:
	idle_people += 1
	update_ui()

func remove_idle_people() -> void:
	if idle_people > 0:
		idle_people -= 1
		update_ui()


func update_ui() -> void:
	if idle_label != null:
		idle_label.text = 'PESSOAS OCIOSAS: ' + str(idle_people)
