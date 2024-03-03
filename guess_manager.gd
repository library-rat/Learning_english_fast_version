extends Node2D

var guess_phrase = "I am me"
signal list_of_word(list)
# Called when the node enters the scene tree for the first time.
func _ready():
	var list_word = guess_phrase.split(" ")
	list_of_word.emit(list_word)
	var screen_size = DisplayServer.screen_get_size()
	var section : int = screen_size.y/list_word.size()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
