extends CharacterBody2D
class_name Drag_Word_Body
signal exited_rest_area()

func exit_word_rest_area():
	emit_signal("exited_rest_area")
