extends Node2D
var word : String

func set_word(word : String):
	self.word = word
	$Label.text = word

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
