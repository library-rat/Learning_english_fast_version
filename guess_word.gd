extends Node2D
class_name Guess_Word
var distancemin: int =  30
var word : Dragable_Word
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _draw ():
	if word == null:
		draw_circle(Vector2.ZERO, distancemin, Color.WHITE)
		var rect = Rect2(Vector2(-distancemin, -distancemin), Vector2(2*distancemin, 2*distancemin))
		draw_rect(rect,Color.WHITE, false,3)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_word(new_word : Dragable_Word):
	if word != null :
		word.start()
	word = new_word
	word.stop()
	word.connect("start_moving", clean_word)
	queue_redraw()
	
func clean_word():
	word.disconnect("start_moving",clean_word)
	word = null
	queue_redraw()
	
