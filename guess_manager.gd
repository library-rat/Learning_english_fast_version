extends Node2D

var guess_word = preload("res://guess_word.tscn")
var guess_fixed = preload("res://guess_fixed.tscn")
var guess_phrase #= "I eat pineapple for breakfast"
var trap_words #= [["ate", "C'est du passé LOSER"],["ananas", "Ananas n'est pas transparent"],["She", "Aucun verbe ne correspond"]]
var const_phrase
var guess_nodes = []
signal list_of_word(list)
signal trap_list(list)
signal trap_answer(text :String)
var ecart : int = 120


func set_dico_and_launch(dico):
	const_phrase = dico["constant"]
	guess_phrase = dico["answer"]
	trap_words = dico["trap"]
	launch()
	
	
# Called when the node enters the scene tree for the first time.
func launch():
	var list_word = guess_phrase.split(" ")
	list_of_word.emit(list_word)
	trap_list.emit(trap_words)
	var screen_size = get_viewport().get_visible_rect().size.x
	for i in range(const_phrase.size()) :
		
		if const_phrase[i] == "_":
			var new_guess =  guess_word.instantiate()
			new_guess.position.x = -floor(const_phrase.size()/ 2)*ecart + screen_size/2
			new_guess.position.x += ecart*i
			add_child(new_guess)
			guess_nodes.append(new_guess)
			new_guess.connect("new_word_set", set_word)
			new_guess.connect("new_trap_set", error_detected)
		else :
			var new_guess =  guess_fixed.instantiate()
			new_guess.position.x = -floor(const_phrase.size()/ 2)*ecart + screen_size/2
			new_guess.position.x += ecart*i
			new_guess.set_word(const_phrase[i])
			add_child(new_guess)

			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func set_word(new_word : Node):
	var list_word = guess_phrase.split(" ")
	var num_ans = 0
	for i in range(const_phrase.size()) :
		if const_phrase[i] == "_" :
			if const_phrase[i] != guess_phrase[num_ans]:
				return
			num_ans += 1
	print("you won")

func error_detected(message : String):
	trap_answer.emit(message)
	for j in range(guess_nodes.size()):
		guess_nodes[j].clean_word()
	return
