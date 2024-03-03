extends Node2D

var guess_word = preload("res://guess_word.tscn")
var guess_phrase = "I am myself"
signal list_of_word(list)
var ecart : int = 200
# Called when the node enters the scene tree for the first time.
func _enter_tree():
	var list_word = guess_phrase.split(" ")
	list_of_word.emit(list_word)
	var screen_size = get_viewport().get_visible_rect().size.x
	for i in range(list_word.size()) :
		var new_guess =  guess_word.instantiate()
		new_guess.position.x = -floor(list_word.size()/ 2)*ecart + screen_size/2
		new_guess.position.x += ecart*i
		new_guess.position.x -= ((1 + list_word.size())%2)*ecart/2
		print(-floor(list_word.size()/ 2)*ecart + ecart*i)
		print(new_guess.position.x)
		print(screen_size)
		add_child(new_guess)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
