extends Node

var word_scene = load("res://word_trajectory.tscn")
var trap_scene = load("res://trap_trajectory.tscn")
var word_list
var trap_list
var child_word_lst = []
signal level_passed()
# Called when the node enters the scene tree for the first time.


func set_level(dico):
	$Guess_Manager.set_dico_and_launch(dico)
	create_words()


func create_words():
	$UI/MarqueurTemps.set_time("Présent")
	for word in word_list :
		var new_word = word_scene.instantiate()
		new_word.assign_word(word)
		add_child(new_word)
		child_word_lst.append(new_word)
	for trap in trap_list :
		var new_word = trap_scene.instantiate()
		new_word.assign_word(trap[0])
		new_word.set_message(trap[1])
		add_child(new_word)
		child_word_lst.append(new_word)
	move_child($UI, -1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_guess_manager_list_of_word(list):
	word_list = list


func _on_guess_manager_trap_list(list):
	trap_list = list


func _on_guess_manager_trap_answer(text):
	$UI.open_error_window(text)

func clear():
	$Guess_Manager.clear()
	for word in child_word_lst :
		word.queue_free()


func _on_guess_manager_level_passed():
	clear()
	level_passed.emit()
