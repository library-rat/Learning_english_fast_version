extends Node2D

var guess_word = preload("res://guess_word.tscn")
var guess_fixed = preload("res://guess_fixed.tscn")
var guess_phrase = "I eat pineapple for breakfast"
var trap_words = [["ate", "C'est du passé LOSER"],["ananas", "Ananas n'est pas transparent"],["She", "Aucun verbe ne correspond"]]
var guess_nodes = []
signal list_of_word(list)
signal trap_list(list)
signal trap_answer(text :String)
var ecart : int = 200
# Called when the node enters the scene tree for the first time.
func _enter_tree():
	var list_word = guess_phrase.split(" ")
	list_of_word.emit(list_word)
	trap_list.emit(trap_words)
	var screen_size = get_viewport().get_visible_rect().size.x
	for i in range(list_word.size()) :
		var new_guess =  guess_word.instantiate()
		new_guess.position.x = -floor(list_word.size()/ 2)*ecart + screen_size/2
		new_guess.position.x += ecart*i
		new_guess.position.x -= ((1 + list_word.size())%2)*ecart/2
		add_child(new_guess)
		guess_nodes.append(new_guess)
		new_guess.connect("new_word_set", set_word)
		new_guess.connect("new_trap_set", error_detected)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func set_word(new_word : Node):
	var list_word = guess_phrase.split(" ")	
	for i in range(list_word.size()) :
		if list_word[i] != guess_nodes[i].word :
			return
	print("you won")

func error_detected(message : String):
	trap_answer.emit(message)
	for j in range(guess_nodes.size()):
		guess_nodes[j].clean_word()
	return
