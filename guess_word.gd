extends Node2D
class_name Guess_Word
var distancemin: int =  30
var word : Dragable_Word
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _draw ():
	print(distancemin)
	if word == null:
		draw_circle(Vector2.ZERO, distancemin, Color.WHITE)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_word(new_word : Dragable_Word):
	print("ok")
	word == new_word
	word.stop()
	queue_redraw()
	
