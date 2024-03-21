extends Node2D
class_name Guess_Word
var distancemin: int =  30
var drag_word : Dragable_Word
var word : String
signal new_word_set(node, word)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _draw ():
	if drag_word == null:
		draw_circle(Vector2.ZERO, distancemin, Color.WHITE)
		var rect = Rect2(Vector2(-distancemin, -distancemin), Vector2(2*distancemin, 2*distancemin))
		draw_rect(rect,Color.WHITE, false,3)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_word(new_word : Dragable_Word):
	if drag_word != null :
		drag_word.start()
	drag_word = new_word
	word = drag_word.text
	new_word_set.emit(self, word)
	drag_word.stop()
	drag_word.connect("start_moving", clean_word)
	queue_redraw()
	
func clean_word():
	drag_word.disconnect("start_moving",clean_word)
	drag_word = null
	word = ""
	queue_redraw()
	
