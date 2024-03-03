extends Node2D

var word_scene = load("res://word_trajectory.tscn")
var word_list
# Called when the node enters the scene tree for the first time.
func _ready():
	for word in word_list :
		var new_word = word_scene.instantiate()
		new_word.assign_word(word)
		add_child(new_word)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_guess_manager_list_of_word(list):
	word_list = list
